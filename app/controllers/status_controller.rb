class StatusController < ApplicationController
  layout "status"
  
  def index
    @stages = Stage.find_all_stages
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first)
    else
      team = Team.find(session[:current_team_id])
    end
    @team_name = team.name
    @team_id = team.id
    @runners = Runner.find_all_runners_for_team_code(team.short_name)
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
    logger.info "update begin"
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

end
