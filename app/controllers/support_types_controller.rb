class SupportTypesController < ApplicationController
  before_filter :authenticate_user!

  # GET /support_types
  # GET /support_types.json
  def index
    @support_types = SupportType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @support_types }
    end
  end

  # GET /support_types/1
  # GET /support_types/1.json
  def show
    @support_type = SupportType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_type }
    end
  end

  # GET /support_types/new
  # GET /support_types/new.json
  def new
    @support_type = SupportType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_type }
    end
  end

  # GET /support_types/1/edit
  def edit
    @support_type = SupportType.find(params[:id])
  end

  # POST /support_types
  # POST /support_types.json
  def create
    @support_type = SupportType.new(params[:support_type])

    respond_to do |format|
      if @support_type.save
        format.html { redirect_to @support_type, notice: 'Support type was successfully created.' }
        format.json { render json: @support_type, status: :created, location: @support_type }
      else
        format.html { render action: "new" }
        format.json { render json: @support_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /support_types/1
  # PUT /support_types/1.json
  def update
    @support_type = SupportType.find(params[:id])

    respond_to do |format|
      if @support_type.update_attributes(params[:support_type])
        format.html { redirect_to @support_type, notice: 'Support type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_types/1
  # DELETE /support_types/1.json
  def destroy
    @support_type = SupportType.find(params[:id])
    @support_type.destroy

    respond_to do |format|
      format.html { redirect_to support_types_url }
      format.json { head :no_content }
    end
  end
end
