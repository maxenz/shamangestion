class ChangeClienteProductoType < ActiveRecord::Migration
  def change
    add_column :clientes_licencias_productos, :clientes_licencia_id, :integer
    add_column :clientes_licencias_productos, :producto_id, :integer
  end
end
