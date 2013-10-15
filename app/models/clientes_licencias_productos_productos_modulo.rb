class ClientesLicenciasProductosProductosModulo < ActiveRecord::Base

	belongs_to :clientes_licencias_producto
	belongs_to :productos_modulo
  	attr_accessible :clientes_licencias_producto_id, :productos_modulo_id

end
