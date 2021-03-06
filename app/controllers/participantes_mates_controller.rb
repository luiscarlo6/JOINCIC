class ParticipantesMatesController < ApplicationController
  # GET /participantes_mates/new
  # GET /participantes_mates/new.json
  def new
    if params[:entrada].blank?
      flash[:notice] = 'Ingresa el número de entrada del participante'
      redirect_to buscar_participantes_mates_path
    else
      if params[:entrada] =~ /^[0-9]+$/ # Regex solo numeros
        @participante = Participante.find_by_entrada(params[:entrada])
        if @participante.nil?
          flash[:notice] = "No se encontró ningún participante cuya entrada sea: <br/>#{params[:entrada]}".html_safe
          redirect_to buscar_participantes_mates_path
        elsif @participante.eliminado
          flash[:notice] = 'Error: El participante fue eliminado del sistema'
          redirect_to buscar_participantes_mates_path
        else
          @participantes_mates = @participante.participantes_mates
          respond_to do |format|
            if @participantes_mates.size > 0
              format.html { render 'edit.html.erb' }
            else
              @materiales_pop = MaterialPop.all
              format.html { render 'new.html.erb' }
            end
          end
        end
      else
        flash[:notice] = 'Error: Número de entrada inválido'
        redirect_to buscar_participantes_mates_path
      end
    end
  end

  # POST /participantes_mates
  # POST /participantes_mates.json
  def entregar
    entrega = ParticipanteMate.find_by_participante_id_and_material_pop_id(params[:participante_id], params[:material_pop_id])
    entrega.update_attribute(:entregado, true)
    @participante = entrega.participante
    @participantes_mates = @participante.participantes_mates
    respond_to do |format|
      format.html { render 'edit.html.erb' }
    end
  end

  # POST /participantes_mates
  # POST /participantes_mates.json
  def create
    @materiales_pop = MaterialPop.all
    @participante = Participante.find_by_entrada(params[:entrada])
    @materiales_pop.each do |material|
      pm = ParticipanteMate.new
      pm.participante = @participante
      pm.material_pop = material
      if params.has_key?(material.nombre)
        pm.entregado = true
      else
        pm.entregado = false
      end
      pm.save unless ParticipanteMate.find_by_participante_id_and_material_pop_id(pm.participante.id, pm.material_pop.id)
    end
    flash[:notice] = '¡Entrega registrada con éxito!'
    redirect_to buscar_participantes_mates_path
  end
end
