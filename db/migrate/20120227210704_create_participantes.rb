class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.integer   :cedula,        :null => false
      t.string    :nombre,        :null => false, :limit => 15
      t.string    :seg_nombre,    :limit => 15
      t.string    :apellido,      :null => false, :limit => 15
      t.string    :seg_apellido,  :limit => 15
      t.date      :fecha_nac,     :null => false
      t.string    :telefono,      :null => false, :limit => 11
      t.string    :correo,        :null => false, :limit => 25
      t.string    :direccion,     :null => false, :limit => 50
      t.string    :institucion,   :null => false, :limit => 20
      t.integer   :nivel,         :null => false
      t.integer   :zona_id,       :null => false
      t.boolean   :comida,        :default => false
      t.boolean   :eliminado,     :default => false
      t.datetime  :created_at
    end
  end
end
