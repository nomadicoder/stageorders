class SupportStatusCodesController < ApplicationController
  before_filter :authenticate_user!

  # GET /support_status_codes
  # GET /support_status_codes.json
  def index
    @support_status_codes = SupportStatusCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @support_status_codes }
    end
  end

  # GET /support_status_codes/1
  # GET /support_status_codes/1.json
  def show
    @support_status_code = SupportStatusCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_status_code }
    end
  end

  # GET /support_status_codes/new
  # GET /support_status_codes/new.json
  def new
    @support_status_code = SupportStatusCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_status_code }
    end
  end

  # GET /support_status_codes/1/edit
  def edit
    @support_status_code = SupportStatusCode.find(params[:id])
  end

  # POST /support_status_codes
  # POST /support_status_codes.json
  def create
    @support_status_code = SupportStatusCode.new(params[:support_status_code])

    respond_to do |format|
      if @support_status_code.save
        format.html { redirect_to @support_status_code, notice: 'Support status code was successfully created.' }
        format.json { render json: @support_status_code, status: :created, location: @support_status_code }
      else
        format.html { render action: "new" }
        format.json { render json: @support_status_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /support_status_codes/1
  # PUT /support_status_codes/1.json
  def update
    @support_status_code = SupportStatusCode.find(params[:id])

    respond_to do |format|
      if @support_status_code.update_attributes(params[:support_status_code])
        format.html { redirect_to @support_status_code, notice: 'Support status code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_status_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_status_codes/1
  # DELETE /support_status_codes/1.json
  def destroy
    @support_status_code = SupportStatusCode.find(params[:id])
    @support_status_code.destroy

    respond_to do |format|
      format.html { redirect_to support_status_codes_url }
      format.json { head :no_content }
    end
  end
end
