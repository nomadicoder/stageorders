class RunnersController < ApplicationController
  before_action :set_runner, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    #@runners = Runner.all
    @runners = Runner.joins(:team).order("teams.number")
    respond_with(@runners)
  end

  def show
    respond_with(@runner)
  end

  def new
    @runner = Runner.new
    respond_with(@runner)
  end

  def edit
  end

  def create
    @runner = Runner.new(runner_params)
    @runner.save
    respond_with(@runner)
  end

  def update
    @runner = Runner.find(params[:id])
    already_completed = @runner.completed

    respond_to do |format|
      # TODO: Too many queries for stage_status update.  Optimize this
      @stage_status = StageStatus.find(:first, :readonly => false, :joins => [:stage, :team],
                                       :conditions => {:stage_id => @runner.stage_id, :team_id => @runner.team_id})
      if !@stage_status.nil? then
        @stage_status.update_attributes(:runner_status_code_id => @runner.runner_status_code_id)
        @stage_status.update_status
      end
      if @runner.update_attributes(params[:runner])
        post_stage_result @runner unless (!@runner.completed && already_completed)
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @runner.destroy
    respond_with(@runner)
  end

  def post_stage_result (runner)
    @team_name = runner.team.name
    @team_id = runner.team.id



    # Create posting
    # NWK Stage 18 result (54:32)
    # LASD Norwalk Station Completed 8.7 miles of Stage 18 with a time of 54:32.
    # Stage was 10:32 off pace. Team is currently xx:xx off pace.

    title = runner.team.name +
            " Stage " + runner.stage.number.to_s +
            " Result (" + runner.actual_time.strftime("%H:%M:%S") + ")"
    description = runner.team.name + " completed the " +
                  runner.stage.miles.to_s + " mile of Stage " +
                  runner.stage.number.to_s + " with a time of " +
                  runner.actual_time.strftime("%H:%M:%S")
    
    # get selected team
    blog = Blog.find(:first, :conditions => { :team_id => runner.team.id })    
    blog_client = BlogClient.new(blog.host_url, blog.access_path, 'blog', blog.username, blog.password)
    
    logger.info "Blog Category : " + blog.category
    logger.info "pub date: " + Time.now.strftime("%m/%d/%Y")
    
    # Post entry to website
    blogpost = {
      'title' => title,
      'description' => description,
      'category' => [blog.category],
      'pubDate' => Time.now.to_s
    }
    
    blog_client.newPost(blogpost, true)
    
  end

  private
    def set_runner
      @runner = Runner.find(params[:id])
    end

    def runner_params
      params.require(:runner).permit(:stage_id, :team_id, :runner_status_code_id, :name, :estimated_pace, :completed, :actual_time)
    end
end
