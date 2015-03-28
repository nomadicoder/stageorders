class SupportStatusCodesController < ApplicationController
  before_action :set_support_status_code, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @support_status_codes = SupportStatusCode.all
    respond_with(@support_status_codes)
  end

  def show
    respond_with(@support_status_code)
  end

  def new
    @support_status_code = SupportStatusCode.new
    respond_with(@support_status_code)
  end

  def edit
  end

  def create
    @support_status_code = SupportStatusCode.new(support_status_code_params)
    @support_status_code.save
    respond_with(@support_status_code)
  end

  def update
    @support_status_code.update(support_status_code_params)
    respond_with(@support_status_code)
  end

  def destroy
    @support_status_code.destroy
    respond_with(@support_status_code)
  end

  private
    def set_support_status_code
      @support_status_code = SupportStatusCode.find(params[:id])
    end

    def support_status_code_params
      params.require(:support_status_code).permit(:sequence, :short_code, :description)
    end
end
