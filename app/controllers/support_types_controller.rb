class SupportTypesController < ApplicationController
  # GET /support_types
  # GET /support_types.xml
  def index
    @support_types = SupportType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_types }
    end
  end

  # GET /support_types/1
  # GET /support_types/1.xml
  def show
    @support_type = SupportType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_type }
    end
  end

  # GET /support_types/new
  # GET /support_types/new.xml
  def new
    @support_type = SupportType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @support_type }
    end
  end

  # GET /support_types/1/edit
  def edit
    @support_type = SupportType.find(params[:id])
  end

  # POST /support_types
  # POST /support_types.xml
  def create
    @support_type = SupportType.new(params[:support_type])

    respond_to do |format|
      if @support_type.save
        flash[:notice] = 'SupportType was successfully created.'
        format.html { redirect_to(@support_type) }
        format.xml  { render :xml => @support_type, :status => :created, :location => @support_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @support_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /support_types/1
  # PUT /support_types/1.xml
  def update
    @support_type = SupportType.find(params[:id])

    respond_to do |format|
      if @support_type.update_attributes(params[:support_type])
        flash[:notice] = 'SupportType was successfully updated.'
        format.html { redirect_to(@support_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @support_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /support_types/1
  # DELETE /support_types/1.xml
  def destroy
    @support_type = SupportType.find(params[:id])
    @support_type.destroy

    respond_to do |format|
      format.html { redirect_to(support_types_url) }
      format.xml  { head :ok }
    end
  end
end
