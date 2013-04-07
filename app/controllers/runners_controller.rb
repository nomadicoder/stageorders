class RunnersController < ApplicationController
  before_filter :authenticate_user!

  # GET /runners
  # GET /runners.json
  def index
    @runners = Runner.find(:all, :joins => [:team, :stage], :order => "teams.number, stages.number")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runners }
    end
  end

  # GET /runners/1
  # GET /runners/1.json
  def show
    @runner = Runner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runner }
    end
  end

  # GET /runners/new
  # GET /runners/new.json
  def new
    @runner = Runner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runner }
    end
  end

  # GET /runners/1/edit
  def edit
    @runner = Runner.find(params[:id])
  end

  # POST /runners
  # POST /runners.json
  def create
    @runner = Runner.new(params[:runner])

    respond_to do |format|
      if @runner.save
        format.html { redirect_to @runner, notice: 'Runner was successfully created.' }
        format.json { render json: @runner, status: :created, location: @runner }
      else
        format.html { render action: "new" }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /runners/1
  # PUT /runners/1.json
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
        post_stage_result @runner unless !@runner.completed unless already_completed
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.json
  def destroy
    @runner = Runner.find(params[:id])
    @runner.destroy

    respond_to do |format|
      format.html { redirect_to runners_url }
      format.json { head :no_content }
    end
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
end
