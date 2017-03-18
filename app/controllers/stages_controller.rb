class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @stages = Stage.all.order(:number)
    respond_to do |format|
      format.html
      format.csv { send_data @stages.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@stage)
  end

  def new
    @stage = Stage.new
    respond_with(@stage)
  end

  def edit
  end

  def create
    @stage = Stage.new(stage_params)
    @stage.save
    respond_with(@stage)
  end

  def update
    @stage.update(stage_params)
    respond_with(@stage)
  end

  def destroy
    @stage.destroy
    respond_with(@stage)
  end

  def import
    Stage.import(params[:file])
    redirect_to root_url, notice: "Stage imported."
  end

protected
  def authorize
  end

  private
    def set_stage
      @stage = Stage.find(params[:id])
    end

    def stage_params
      params.require(:stage).permit(:number, :landmark, :miles, :difficulty)
    end
end
