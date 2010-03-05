class StageStatusCodesController < ApplicationController
  # GET /stage_status_codes
  # GET /stage_status_codes.xml
  def index
    @stage_status_codes = StageStatusCode.all(:order => "sequence")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_status_codes }
    end
  end

  # GET /stage_status_codes/1
  # GET /stage_status_codes/1.xml
  def show
    @stage_status_code = StageStatusCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage_status_code }
    end
  end

  # GET /stage_status_codes/new
  # GET /stage_status_codes/new.xml
  def new
    @stage_status_code = StageStatusCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage_status_code }
    end
  end

  # GET /stage_status_codes/1/edit
  def edit
    @stage_status_code = StageStatusCode.find(params[:id])
  end

  # POST /stage_status_codes
  # POST /stage_status_codes.xml
  def create
    @stage_status_code = StageStatusCode.new(params[:stage_status_code])

    respond_to do |format|
      if @stage_status_code.save
        flash[:notice] = 'StageStatusCode was successfully created.'
        format.html { redirect_to(@stage_status_code) }
        format.xml  { render :xml => @stage_status_code, :status => :created, :location => @stage_status_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage_status_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stage_status_codes/1
  # PUT /stage_status_codes/1.xml
  def update
    @stage_status_code = StageStatusCode.find(params[:id])

    respond_to do |format|
      if @stage_status_code.update_attributes(params[:stage_status_code])
        flash[:notice] = 'StageStatusCode was successfully updated.'
        format.html { redirect_to(@stage_status_code) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage_status_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_status_codes/1
  # DELETE /stage_status_codes/1.xml
  def destroy
    @stage_status_code = StageStatusCode.find(params[:id])
    @stage_status_code.destroy

    respond_to do |format|
      format.html { redirect_to(stage_status_codes_url) }
      format.xml  { head :ok }
    end
  end
end
