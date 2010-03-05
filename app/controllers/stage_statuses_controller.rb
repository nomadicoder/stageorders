class StageStatusesController < ApplicationController
  # GET /stage_statuses
  # GET /stage_statuses.xml
  def index
    @stage_statuses = StageStatus.find_all_stage_statuses

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_statuses }
    end
  end

  # GET /stage_statuses/1
  # GET /stage_statuses/1.xml
  def show
    @stage_status = StageStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage_status }
    end
  end

  # GET /stage_statuses/new
  # GET /stage_statuses/new.xml
  def new
    @stage_status = StageStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage_status }
    end
  end

  # GET /stage_statuses/1/edit
  def edit
    @stage_status = StageStatus.find(params[:id])
  end

  # POST /stage_statuses
  # POST /stage_statuses.xml
  def create
    @stage_status = StageStatus.new(params[:stage_status])

    respond_to do |format|
      if @stage_status.save
        flash[:notice] = 'StageStatus was successfully created.'
        format.html { redirect_to(@stage_status) }
        format.xml  { render :xml => @stage_status, :status => :created, :location => @stage_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stage_statuses/1
  # PUT /stage_statuses/1.xml
  def update
    @stage_status = StageStatus.find(params[:id])

    respond_to do |format|
      if @stage_status.update_attributes(params[:stage_status])
        flash[:notice] = 'StageStatus was successfully updated.'
        format.html { redirect_to(@stage_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_statuses/1
  # DELETE /stage_statuses/1.xml
  def destroy
    @stage_status = StageStatus.find(params[:id])
    @stage_status.destroy

    respond_to do |format|
      format.html { redirect_to(stage_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
