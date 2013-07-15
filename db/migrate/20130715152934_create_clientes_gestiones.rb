class CreateClientesGestiones < ActiveRecord::Migration
  def change
    create_table :clientes_gestiones do |t|
      t.integer :estado_id
      t.integer :cliente_id
      t.date :fecha
      t.text :observaciones

      t.timestamps
    end
  end
end
