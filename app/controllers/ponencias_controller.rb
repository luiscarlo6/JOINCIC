class PonenciasController < ApplicationController
  skip_before_filter :organizadorLogin, only: [:index, :show]
  before_action :set_ponencia, only: [:show, :edit, :update, :destroy]

  # GET /ponencias
  # GET /ponencias.json
  def index
    @ponencias = Ponencia.all
    respond_to do |format|
      format.html
      format.json { render json: @ponencias.to_json(include: [:ponente]) }
    end
  end

  # GET /ponencias/1
  # GET /ponencias/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @ponencia.to_json(include: [:ponente]) }
    end
  end

  # GET /ponencias/new
  def new
    @ponencia = Ponencia.new
    @ponentes = Ponente.all
    @patrocinantes = Patrocinante.all
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /ponencias/1/edit
  def edit
    @ponentes = Ponente.all
    @patrocinantes = Patrocinante.all
  end

  # POST /ponencias
  def create
    @ponencia = Ponencia.new(ponencia_params)
    respond_to do |format|
      if @ponencia.save
        format.html { redirect_to @ponencia, notice: 'Ponencia was successfully created.' }
      else
        @ponentes = Ponente.all
        @patrocinantes = Patrocinante.all
        format.html { render 'new.html.erb' }
      end
    end
  end

  # PUT /ponencias/1
  def update
    respond_to do |format|
      if @ponencia.update_attributes(ponencia_params)
        format.html { redirect_to @ponencia, notice: 'Ponencia was successfully updated.' }
      else
        @ponentes = Ponente.all
        @patrocinantes = Patrocinante.all
        format.html { render 'edit.html.erb' }
      end
    end
  end

  # DELETE /ponencias/1
  def destroy
    @ponencia.destroy
    respond_to do |format|
      format.html { redirect_to ponencias_url }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def ponencia_params
    params.require(:ponencia).permit(
      :titulo, :tema, :descripcion, :dia, :hora_ini, :hora_fin, :requerimientos, :ponente_id, :patrocinante_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_ponencia
    @ponencia = Ponencia.find(params[:id])
  end
end
