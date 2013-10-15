class ProductosModulo < ActiveRecord::Base

	belongs_to :producto
	has_many :clientes_licencias_productos_productos_modulos,:dependent => :destroy
	has_many :clientes_licencias_productos, :through => :clientes_licencias_productos_productos_modulos
	accepts_nested_attributes_for :clientes_licencias_productos_productos_modulos
  	attr_accessible :abreviatura_id, :descripcion, :producto_id, :clientes_licencias_productos_productos_modulos_attributes
end
