class CreateClientesLicenciasProductos < ActiveRecord::Migration
  def change
    create_table :clientes_licencias_productos do |t|

      t.timestamps
    end
  end
end
