class ResultsController < ApplicationController
  def index
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first)
    else
      team = Team.find(session[:current_team_id])
    end
    @team_name = team.name
    @runners = Runner.find(:all, :joins => [:stage], :conditions => {:team_id => team.id}, :order => "stages.number")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_statuses }
    end
  end

  def change_team
    if params[:team][:team_id].nil? || params[:team][:team_id].blank?
      session[:current_team_id] = Team.find(:first).id
    else
      session[:current_team_id] = params[:team][:team_id]
    end
    @team = Team.find(session[:current_team_id])
    redirect_to :action => :index
  end

  def authorize
  end

end
