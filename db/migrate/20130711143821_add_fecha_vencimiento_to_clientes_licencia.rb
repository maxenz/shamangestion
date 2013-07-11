class AddFechaVencimientoToClientesLicencia < ActiveRecord::Migration
  def change
  	add_column :clientes_licencias, :fecha_de_vencimiento, :date
  end
end
