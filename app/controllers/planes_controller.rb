class PlanesController < ApplicationController
  # GET /planes
  # GET /planes.json
  def index
    @planes = Plan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json => @planes }
    end
  end

  # GET /planes/1
  # GET /planes/1.json
  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json => @plan }
    end
  end

  # GET /planes/new
  # GET /planes/new.json
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json => @plan }
    end
  end

  # GET /planes/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /planes
  # POST /planes.json
  def create
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice => 'Plan was successfully created.' }
        format.json { render json => @plan, status => :created, location => @plan }
      else
        format.html { render "new.html.erb" }
        format.json { render json => @plan.errors, status => :unprocessable_entity }
      end
    end
  end

  # PUT /planes/1
  # PUT /planes/1.json
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to @plan, notice => 'Plan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render "edit.html.erb" }
        format.json { render json => @plan.errors, status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planes/1
  # DELETE /planes/1.json
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to planes_url }
      format.json { head :ok }
    end
  end
end
