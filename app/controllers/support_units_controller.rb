class SupportUnitsController < ApplicationController
  # GET /support_units
  # GET /support_units.xml
  def index
    @support_units = SupportUnit.find(:all, :joins => [:team],  :order => :tac_callsign)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_units }
    end
  end

  # GET /support_units/1
  # GET /support_units/1.xml
  def show
    @support_unit = SupportUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_unit }
    end
  end

  # GET /support_units/new
  # GET /support_units/new.xml
  def new
    @support_unit = SupportUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @support_unit }
    end
  end

  # GET /support_units/1/edit
  def edit
    @support_unit = SupportUnit.find(params[:id])
  end

  # POST /support_units
  # POST /support_units.xml
  def create
    @support_unit = SupportUnit.new(params[:support_unit])

    respond_to do |format|
      if @support_unit.save
        flash[:notice] = 'SupportUnit was successfully created.'
        format.html { redirect_to(@support_unit) }
        format.xml  { render :xml => @support_unit, :status => :created, :location => @support_unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @support_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /support_units/1
  # PUT /support_units/1.xml
  def update
    @support_unit = SupportUnit.find(params[:id])

    respond_to do |format|
      if @support_unit.update_attributes(params[:support_unit])
        @stage_status = StageStatus.find(:first, :readonly => false, :joins => [:stage, :team],
                                         :conditions => {:stage_id => @support_unit.current_stage_id, :team_id => @support_unit.team_id})
        if !@stage_status.nil? then
          @stage_status.update_attributes(:support_status_code_id => @support_unit.support_status_code_id)
          @stage_status.update_status
        end
        flash[:notice] = 'SupportUnit was successfully updated.'
        format.html { redirect_to(@support_unit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @support_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /support_units/1
  # DELETE /support_units/1.xml
  def destroy
    @support_unit = SupportUnit.find(params[:id])
    @support_unit.destroy

    respond_to do |format|
      format.html { redirect_to(support_units_url) }
      format.xml  { head :ok }
    end
  end
end
