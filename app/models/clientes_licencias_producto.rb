class ClientesLicenciasProducto < ActiveRecord::Base

	belongs_to :clientes_licencia
	belongs_to :producto
	has_many :clientes_licencias_productos_productos_modulos,:dependent => :destroy
	has_many :productos_modulos, :through => :clientes_licencias_productos_productos_modulos
	accepts_nested_attributes_for :clientes_licencias_productos_productos_modulos, :productos_modulos
	attr_accessible :clientes_licencia_id, :producto_id, :clientes_licencias_productos_productos_modulos_attributes,:productos_modulo_ids, :productos_modulos

end
