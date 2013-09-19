class CreateUsuariosClientes < ActiveRecord::Migration
  def change
    create_table :usuarios_clientes do |t|
      t.integer :usuario_id
      t.integer :cliente_id
      t.integer :shaman_full_id
      t.integer :shaman_express_id

      t.timestamps
    end
  end
end
