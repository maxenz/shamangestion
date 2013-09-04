class CreateClientesTerminales < ActiveRecord::Migration
  def change
    create_table :clientes_terminales do |t|
      t.integer :tipo_id
      t.integer :cliente_id
      t.string :valor1
      t.string :valor2
      t.string :valor3
      t.string :valor4
      t.string :referencia

      t.timestamps
    end
  end
end
