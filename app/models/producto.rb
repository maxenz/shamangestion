class Producto < ActiveRecord::Base

	has_and_belongs_to_many :licencias
	has_many :productos_modulos
	accepts_nested_attributes_for :licencias, :productos_modulos
  	attr_accessible :descripcion, :nro_producto

  	validates_presence_of :nro_producto
  	validates_numericality_of :nro_producto
  	validates_uniqueness_of :nro_producto

  	validates_presence_of :descripcion
  	validates_uniqueness_of :descripcion

end
