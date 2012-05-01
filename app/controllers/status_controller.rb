class StatusController < ApplicationController
  def index
    update_index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_statuses }
    end
  end
  
  def change_team
    if params[:team][:id].nil? || params[:team][:id].blank?
      session[:current_team_id] = Team.find(:first).id
    else
      session[:current_team_id] = params[:team][:id]
    end
    @team = Team.find(session[:current_team_id])
    #redirect_to :action => :index
    update_index    
    render :partial => "status_table"
  end

  def refresh
    update_index

    render :partial => "stage_table"
  end

  def set_runner_form_params
    @teams = Team.find(:all)
    team = Team.find(session[:current_team_id])
    @team_id = team.id
    @stages = Stage.find_all_stages
    stage = Stage.find(session[:current_stage_id])
    @stage_id = stage.id
    @runners = Runner.find_all_runners_for_team(team)
    runners = Runner.find_all_runners_for_team_and_stage(team, stage)
    if !runners.first.nil?
      @runner_id = runners.first.id
    end
  end

  def update_team_runners
    if params[:update_team_id].nil? || params[:update_team_id].blank?
      session[:current_team_id] = Team.find(:first).id
    else
      session[:current_team_id] = params[:update_team_id]
    end
    set_runner_form_params
    render :partial => "update_team_runners"
  end
  
  def update_stage_runners
    if params[:update_stage_id].nil? || params[:update_stage_id].blank?
      session[:current_stage_id] = Stage.find(:first).id
    else
      session[:current_stage_id] = params[:update_stage_id]
    end
    set_runner_form_params
    render :partial => "update_team_runners"
  end
  
  def update_runner
    runner = params[:runner]
    @runner = Runner.find(runner[:runner_id])
    stage_result  = {
      :completed => runner[:completed].to_i,
      :actual_time_formatted => runner[:actual_time_formatted],
      :runner_status_code_id => runner[:runner_status_code_id].to_i
    }
    
    logger.info "Stage Result: " + stage_result.to_s

    if @runner.update_attributes(stage_result)
      # TODO: Too many queries for stage_status update.  Optimize this
#      @stage_status = StageStatus.find(:first, :readonly => false, :joins => [:stage, :team],
#                                       :conditions => {:stage_id => @runner.stage_id, :team_id => @runner.team_id})
#      if !@stage_status.nil? then
#        @stage_status.update_attributes(:runner_status_code_id => @runner.runner_status_code_id)
#        @stage_status.update_status
#      end
      flash[:notice] = 'Runner was successfully updated.'
    end

    redirect_to :action => :update
  end
  
  def update
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first)
    else
      team = Team.find(session[:current_team_id])
    end
    if session[:current_stage_id].nil? || session[:current_stage_id].blank?
      stage = Stage.find(:first)
    else
      stage = Stage.find(session[:current_stage_id])
    end
    if session[:current_runner_id].nil? || session[:current_runner_id].blank?
      runner = Runner.find(:first)
    else
      runner = Runner.find(session[:current_runner_id])
    end
    set_runner_form_params
  end
  
  def update_blog
    team = Team.find(params[:post][:team_id])
    title = params[:post][:title]
    description = params[:post][:content]
    @team_name = team.name
    @team_id = team.id
    
    # get selected team
    blog = Blog.find(:first, :conditions => { :team_id => team.id })    
    blog_client = BlogClient.new(blog.host_url, blog.access_path, 'blog', blog.username, blog.password)
    
    blog_categories = blog_client.getCategories
    logger.info "Blog Categories : " + blog_categories.to_s
    logger.info "Blog Categories : " + blog_categories[0].to_s
    
    # Post entry to website
    blogpost = {
      'title' => title,
      'description' => description,
      'categories' => ["LASD MCJ/IRC"],
      'pubDate' => Time.now
    }
    
    publish = (params[:post][:publish].to_i == 1)
    blog_client.newPost(blogpost, publish)
    
    redirect_to :action => :update
  end
  
  def update_results
    team = Team.find(params[:results][:team_id])
    @team_name = team.name
    @team_id = team.id
    # get selected team
    blog = Blog.find(:first, :conditions => { :team_id => team.id })
    
    blog_client = BlogClient.new(blog.host_url, blog.access_path, 'page', blog.username, blog.password)
    
    # Create runner results tabel for team
    @runners = Runner.find(:all, :joins => [:stage], :conditions => {:team_id => team.id}, :order => "stages.number")
    
    update_index
    
    # Render the HTML for the table
    @results = Results.new (team)
    results_table = render_to_string :partial => "results_table"
    
    #Post runner results table to public website
    
    results_post = {
      'title' => team.name + " Stage Results",
      'description' => results_table,
      'pubDate' => Time.now
    }
    
    blog_client.editPost(blog.results_post_number.to_s, results_post, true)

    redirect_to :action => :update
  end
  
private
  def update_index
    stage_collection = Stage.find_all_stages
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first, :conditions => "number > 0", :order => :number)
    else
      team = Team.find(session[:current_team_id])
    end
    @team_name = team.name
    @team_id = team.id
    @stage_statuses = StageStatus.find(:all, :joins => [:stage], :conditions => {:team_id => team.id}, :order => "stages.number")
  end

end
