class Producto < ActiveRecord::Base
	has_and_belongs_to_many :licencias
	accepts_nested_attributes_for :licencias
  attr_accessible :descripcion, :nro_producto
end
