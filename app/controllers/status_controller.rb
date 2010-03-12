class StatusController < ApplicationController
  def index
    stage_collection = Stage.find_all_stages
    if session[:current_team_id].nil?
      team = Team.find(:first)
    else
      team = Team.find(session[:current_team_id]) unless session[:current_team_id].nil?
    end
    short_name = team.short_name
    @runners = Runner.find_all_runners_for_team_code(short_name)
    #@support_unit = SupportUnits.find_all_support_units
    @stages = stage_collection
  end
  
  def change_team
    if params[:team][:team_id].nil?
      session[:current_team_id] = Team.find(:first).id
    else
      session[:current_team_id] = params[:team][:team_id]
    end
    @team = Team.find(session[:current_team_id])
    redirect_to :action => :index
  end

  def update
  end

end
