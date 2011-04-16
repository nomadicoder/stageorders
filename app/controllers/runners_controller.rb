class RunnersController < ApplicationController
  # GET /runners
  # GET /runners.xml
  def index
    @runners = Runner.find(:all, :joins => [:team, :stage], :order => "teams.number, stages.number")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @runners }
    end
  end

  # GET /runners/1
  # GET /runners/1.xml
  def show
    @runner = Runner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @runner }
    end
  end

  # GET /runners/new
  # GET /runners/new.xml
  def new
    @runner = Runner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @runner }
    end
  end

  # GET /runners/1/edit
  def edit
    @runner = Runner.find(params[:id])
  end

  # POST /runners
  # POST /runners.xml
  def create
    @runner = Runner.new(params[:runner])

    respond_to do |format|
      if @runner.save
        flash[:notice] = 'Runner was successfully created.'
        format.html { redirect_to(@runner) }
        format.xml  { render :xml => @runner, :status => :created, :location => @runner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @runner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runners/1
  # PUT /runners/1.xml
  def update
    @runner = Runner.find(params[:id])
    already_completed = @runner.completed
    respond_to do |format|
      if @runner.update_attributes(params[:runner])
        # TODO: Too many queries for stage_status update.  Optimize this
        @stage_status = StageStatus.find(:first, :readonly => false, :joins => [:stage, :team],
                                         :conditions => {:stage_id => @runner.stage_id, :team_id => @runner.team_id})
        if !@stage_status.nil? then
          @stage_status.update_attributes(:runner_status_code_id => @runner.runner_status_code_id)
          @stage_status.update_status
        end

        flash[:notice] = 'Runner was successfully updated.'
        post_stage_result @runner unless !@runner.completed unless already_completed
        format.html { redirect_to(@runner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @runner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.xml
  def destroy
    @runner = Runner.find(params[:id])
    @runner.destroy

    respond_to do |format|
      format.html { redirect_to(runners_url) }
      format.xml  { head :ok }
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
