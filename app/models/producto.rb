class Producto < ActiveRecord::Base

	has_and_belongs_to_many :licencias
	has_many :productos_modulos
	accepts_nested_attributes_for :licencias, :productos_modulos
  has_many :clientes_licencias_productos
	has_many :clientes_licencias, :through => :clientes_licencias_productos
  	attr_accessible :descripcion, :nro_producto, :clientes_licencias_productos_attributes, :productos_modulos_attributes, :productos_modulos

  	validates_presence_of :nro_producto
  	validates_numericality_of :nro_producto
  	validates_uniqueness_of :nro_producto

  	validates_presence_of :descripcion
  	validates_uniqueness_of :descripcion

end
