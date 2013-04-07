class RunnerStatusCodesController < ApplicationController
  before_filter :authenticate_user!

  # GET /runner_status_codes
  # GET /runner_status_codes.json
  def index
    @runner_status_codes = RunnerStatusCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runner_status_codes }
    end
  end

  # GET /runner_status_codes/1
  # GET /runner_status_codes/1.json
  def show
    @runner_status_code = RunnerStatusCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runner_status_code }
    end
  end

  # GET /runner_status_codes/new
  # GET /runner_status_codes/new.json
  def new
    @runner_status_code = RunnerStatusCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runner_status_code }
    end
  end

  # GET /runner_status_codes/1/edit
  def edit
    @runner_status_code = RunnerStatusCode.find(params[:id])
  end

  # POST /runner_status_codes
  # POST /runner_status_codes.json
  def create
    @runner_status_code = RunnerStatusCode.new(params[:runner_status_code])

    respond_to do |format|
      if @runner_status_code.save
        format.html { redirect_to @runner_status_code, notice: 'Runner status code was successfully created.' }
        format.json { render json: @runner_status_code, status: :created, location: @runner_status_code }
      else
        format.html { render action: "new" }
        format.json { render json: @runner_status_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /runner_status_codes/1
  # PUT /runner_status_codes/1.json
  def update
    @runner_status_code = RunnerStatusCode.find(params[:id])

    respond_to do |format|
      if @runner_status_code.update_attributes(params[:runner_status_code])
        format.html { redirect_to @runner_status_code, notice: 'Runner status code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @runner_status_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runner_status_codes/1
  # DELETE /runner_status_codes/1.json
  def destroy
    @runner_status_code = RunnerStatusCode.find(params[:id])
    @runner_status_code.destroy

    respond_to do |format|
      format.html { redirect_to runner_status_codes_url }
      format.json { head :no_content }
    end
  end
end
