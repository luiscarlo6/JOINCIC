class CreateMesasDeTrabajo < ActiveRecord::Migration
  def change
    create_table :mesas_de_trabajo do |t|
      t.string  :titulo,          :null => false, :limit => 25
      t.string  :tema,            :null => false, :limit => 25
      t.string  :descripcion,     :null => false
      t.date    :dia
      t.time    :hora_ini
      t.time    :hora_fin
      t.string  :lugar,           :null => false, :limit => 25
      t.integer :capacidad
      t.string  :requerimientos,  :null => false
      t.integer :id_ponente
      t.integer :id_pat
    end
  end
end
