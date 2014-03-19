require 'assets/blog_client'

class StageStatusesController < ApplicationController
  before_filter :authenticate_user!

  # GET /stage_statuses
  # GET /stage_statuses.xml
  def index
    stage_collection = Stage.find_all_stages
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first, :conditions => "number > 0", :order => :number)
    else
      team = Team.find(session[:current_team_id])
    end
    @team_name = team.name
    @team_id = team.id
    @stage_statuses = StageStatus.find(:all, :joins => [:stage], :conditions => {:team_id => team.id}, :order => "stages.number")

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
    
    update_index    
    render :partial => "status_table"
  end
  
  def refresh
    update_index
    render :partial => "stage_table"
  end

  # GET /stage_statuses/1
  # GET /stage_statuses/1.xml
  def show
    @stage_status = StageStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage_status }
    end
  end

  # GET /stage_statuses/new
  # GET /stage_statuses/new.xml
  def new
    @stage_status = StageStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage_status }
    end
  end

  # GET /stage_statuses/1/edit
  def edit
    @stage_status = StageStatus.find(params[:id])
  end

  # POST /stage_statuses
  # POST /stage_statuses.xml
  def create
    @stage_status = StageStatus.new(params[:stage_status])

    respond_to do |format|
      if @stage_status.save
        flash[:notice] = 'StageStatus was successfully created.'
        format.html { redirect_to(@stage_status) }
        format.xml  { render :xml => @stage_status, :status => :created, :location => @stage_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stage_statuses/1
  # PUT /stage_statuses/1.xml
  def update
    @stage_status = StageStatus.find(params[:id])

    respond_to do |format|
      if @stage_status.update_attributes(params[:stage_status])
        flash[:notice] = 'StageStatus was successfully updated.'
        format.html { redirect_to(@stage_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_statuses/1
  # DELETE /stage_statuses/1.xml
  def destroy
    @stage_status = StageStatus.find(params[:id])
    @stage_status.destroy

    respond_to do |format|
      format.html { redirect_to(stage_statuses_url) }
      format.xml  { head :ok }
    end
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
    
    logger.info "Blog Category : " + blog.category
    logger.info "pub date: " + Time.now.strftime("%m/%d/%Y")
    
    # Post entry to website
    blogpost = {
      'title' => title,
      'description' => description,
      'category' => [blog.category],
      'pubDate' => Time.now.to_s
    }
    
    publish = (params[:post][:publish].to_i == 1)
    blog_client.newPost(blogpost, publish)
    
    redirect_to :back
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
      'pubDate' => Time.now.to_s
    }
    
    blog_client.editPost(blog.results_post_number.to_s, results_post, true)

    redirect_to :back
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
