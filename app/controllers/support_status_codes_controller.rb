class SupportStatusCodesController < ApplicationController
  # GET /support_status_codes
  # GET /support_status_codes.xml
  def index
    @support_status_codes = SupportStatusCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_status_codes }
    end
  end

  # GET /support_status_codes/1
  # GET /support_status_codes/1.xml
  def show
    @support_status_code = SupportStatusCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_status_code }
    end
  end

  # GET /support_status_codes/new
  # GET /support_status_codes/new.xml
  def new
    @support_status_code = SupportStatusCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @support_status_code }
    end
  end

  # GET /support_status_codes/1/edit
  def edit
    @support_status_code = SupportStatusCode.find(params[:id])
  end

  # POST /support_status_codes
  # POST /support_status_codes.xml
  def create
    @support_status_code = SupportStatusCode.new(params[:support_status_code])

    respond_to do |format|
      if @support_status_code.save
        flash[:notice] = 'SupportStatusCode was successfully created.'
        format.html { redirect_to(@support_status_code) }
        format.xml  { render :xml => @support_status_code, :status => :created, :location => @support_status_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @support_status_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /support_status_codes/1
  # PUT /support_status_codes/1.xml
  def update
    @support_status_code = SupportStatusCode.find(params[:id])

    respond_to do |format|
      if @support_status_code.update_attributes(params[:support_status_code])
        flash[:notice] = 'SupportStatusCode was successfully updated.'
        format.html { redirect_to(@support_status_code) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @support_status_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /support_status_codes/1
  # DELETE /support_status_codes/1.xml
  def destroy
    @support_status_code = SupportStatusCode.find(params[:id])
    @support_status_code.destroy

    respond_to do |format|
      format.html { redirect_to(support_status_codes_url) }
      format.xml  { head :ok }
    end
  end
end
