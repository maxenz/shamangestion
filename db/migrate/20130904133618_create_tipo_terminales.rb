class CreateTipoTerminales < ActiveRecord::Migration
  def change
    create_table :tipo_terminales do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
