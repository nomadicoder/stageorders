require 'assets/blog_client'

class StageStatusesController < ApplicationController
  before_action :set_stage_status, only: [:show, :edit, :update, :destroy]

  respond_to :html

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

    respond_with(@stage_statuses)
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

  def show
    respond_with(@stage_status)
  end

  def new
    @stage_status = StageStatus.new
    respond_with(@stage_status)
  end

  def edit
  end

  def create
    @stage_status = StageStatus.new(stage_status_params)
    @stage_status.save
    respond_with(@stage_status)
  end

  def update
    @stage_status.update(stage_status_params)
    respond_with(@stage_status)
  end

  def destroy
    @stage_status.destroy
    respond_with(@stage_status)
  end

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
    def set_stage_status
      @stage_status = StageStatus.find(params[:id])
    end

    def stage_status_params
      params.require(:stage_status).permit(:team_id, :stage_id, :runner_id, :support_unit_id, :runner_status_code_id, :support_status_code_id, :stage_status_code_id)
    end

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
