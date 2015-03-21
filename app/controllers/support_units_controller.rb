class SupportUnitsController < ApplicationController
  before_action :set_support_unit, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @support_units = SupportUnit.all
    respond_with(@support_units)
  end

  def show
    respond_with(@support_unit)
  end

  def new
    @support_unit = SupportUnit.new
    respond_with(@support_unit)
  end

  def edit
  end

  def create
    @support_unit = SupportUnit.new(support_unit_params)
    @support_unit.save
    respond_with(@support_unit)
  end

  def update
    @support_unit.update(support_unit_params)

    respond_to do |format|
      if @support_unit.update_attributes(params[:support_unit])
        # TODO: Too many queries for stage_status update.  Optimize this
        @stage_status = StageStatus.find(:first, :readonly => false, :joins => [:stage, :team],
                                         :conditions => {:stage_id => @support_unit.current_stage_id, :team_id => @support_unit.team_id})
        if !@stage_status.nil? then
          @stage_status.update_attributes(:support_status_code_id => @support_unit.support_status_code_id)
          @stage_status.update_status
        end
        format.html { redirect_to @support_unit, notice: 'Support unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @support_unit.destroy
    respond_with(@support_unit)
  end

  private
    def set_support_unit
      @support_unit = SupportUnit.find(params[:id])
    end

    def support_unit_params
      params.require(:support_unit).permit(:team_id, :support_type_id, :tac_callsign, :ham_callsign, :support_status_code_id, :current_stage_id, :location_lat, :location_lon)
    end
end
