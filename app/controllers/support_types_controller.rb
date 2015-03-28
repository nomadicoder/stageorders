class SupportTypesController < ApplicationController
  before_action :set_support_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @support_types = SupportType.all
    respond_with(@support_types)
  end

  def show
    respond_with(@support_type)
  end

  def new
    @support_type = SupportType.new
    respond_with(@support_type)
  end

  def edit
  end

  def create
    @support_type = SupportType.new(support_type_params)
    @support_type.save
    respond_with(@support_type)
  end

  def update
    @support_type.update(support_type_params)
    respond_with(@support_type)
  end

  def destroy
    @support_type.destroy
    respond_with(@support_type)
  end

  private
    def set_support_type
      @support_type = SupportType.find(params[:id])
    end

    def support_type_params
      params.require(:support_type).permit(:short_code, :description)
    end
end
