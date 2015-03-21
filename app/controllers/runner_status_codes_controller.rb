class RunnerStatusCodesController < ApplicationController
  before_action :set_runner_status_code, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @runner_status_codes = RunnerStatusCode.all
    respond_with(@runner_status_codes)
  end

  def show
    respond_with(@runner_status_code)
  end

  def new
    @runner_status_code = RunnerStatusCode.new
    respond_with(@runner_status_code)
  end

  def edit
  end

  def create
    @runner_status_code = RunnerStatusCode.new(runner_status_code_params)
    @runner_status_code.save
    respond_with(@runner_status_code)
  end

  def update
    @runner_status_code.update(runner_status_code_params)
    respond_with(@runner_status_code)
  end

  def destroy
    @runner_status_code.destroy
    respond_with(@runner_status_code)
  end

  private
    def set_runner_status_code
      @runner_status_code = RunnerStatusCode.find(params[:id])
    end

    def runner_status_code_params
      params.require(:runner_status_code).permit(:sequence, :short_code, :description)
    end
end
