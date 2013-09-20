class AddConexionServidorToClientesLicencia < ActiveRecord::Migration
  def change
    add_column :clientes_licencias, :conexion_servidor, :string
  end
end
