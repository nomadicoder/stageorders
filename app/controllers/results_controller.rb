class ResultsController < ApplicationController
  def index
    update_index
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_statuses }
    end 
  end
  
  def calculate_stage_results (stage_number)
    @results.calculate_stage_results
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

  def authorize
  end
  
private
  def update_index
    if session[:current_team_id].nil? || session[:current_team_id].blank?
      team = Team.find(:first, :conditions => "number > 0", :order => :number)
    else
      team = Team.find(session[:current_team_id])
    end
    @start_time = team.start_time
    @team_name = team.name
    @team_id = team.id
    @runners = Runner.find(:all, :joins => [:stage], :conditions => {:team_id => team.id}, :order => "stages.number")
    puts @team_id
    @results = Results.new (team)
  end

end
