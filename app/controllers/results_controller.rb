class ResultsController < ApplicationController
  layout "results"

  def index
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first, :conditions => "number > 0", :order => :number)
    else
      team = Team.find(session[:current_team_id])
    end
    @team_rec = team
    @start_time = team.start_time
    @team_name = team.name
    @team_id = team.id
    @runners = Runner.find(:all, :joins => [:stage], :conditions => {:team_id => team.id}, :order => "stages.number")
    
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
    redirect_to :action => :index
  end

  def authorize
  end

end
