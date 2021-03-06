class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @teams = Team.all
    respond_to do |format|
      format.html
      format.csv { send_data @teams.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.save
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  def import
    Team.import(params[:file])
    redirect_to root_url, notice: "Teams imported."
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:number, :name, :short_name, :start_time)
    end
end
