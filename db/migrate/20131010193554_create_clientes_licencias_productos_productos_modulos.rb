class CreateClientesLicenciasProductosProductosModulos < ActiveRecord::Migration
  def change
    create_table :clientes_licencias_productos_productos_modulos do |t|
      t.integer :clientes_licencias_producto_id
      t.integer :productos_modulo_id

      t.timestamps
    end
  end
end
