class StatusController < ApplicationController
  layout "status"
  
  def index
    update_index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_statuses }
    end
  end
  
  def change_team
    if params[:id].nil? || params[:id].blank?
      session[:current_team_id] = Team.find(:first).id
    else
      session[:current_team_id] = params[:id]
    end
    @team = Team.find(session[:current_team_id])
    redirect_to :action => :index
  end

  def refresh
    update_index

    render :partial => "stage_table"
  end

  def update_team_runners
    stage_collection = Stage.find_all_stages
    team_collection = Team.find(:all)
    if params[:update_team_id].nil? || params[:update_team_id].blank?
      session[:current_team_id] = Team.find(:first).id
    else
      session[:current_team_id] = params[:update_team_id]
    end
    team = Team.find(session[:current_team_id])
    @team_id = team.id
    @runners = Runner.find_all_runners_for_team_code(team.short_name)
    @stages = stage_collection
    render :partial => "update_team_runners"
  end
  
  def update
    stage_collection = Stage.find_all_stages
    team_collection = Team.find(:all)
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first)
    else
      team = Team.find(session[:current_team_id])
    end
    @teams = team_collection
    @team_name = team.name
    @team_id = team.id
    @runners = Runner.find_all_runners_for_team_code(team.short_name)
    @stages = stage_collection
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
    
    # Render the HTML for the table
    results_table = render_to_string :partial => "results/stage_table"
    
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
