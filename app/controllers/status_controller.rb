class StatusController < ApplicationController
  def index
    stage_collection = Stage.find_all_stages
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first)
    else
      team = Team.find(session[:current_team_id])
    end
    @team_name = team.name
    @team_id = team.id
    @runners = Runner.find_all_runners_for_team_code(team.short_name)
    @stages = stage_collection
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

  def update
  end

end
