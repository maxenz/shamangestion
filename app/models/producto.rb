class Producto < ActiveRecord::Base
	has_many_and_belongs_to_many :licencias

  attr_accessible :descripcion, :nro_producto, :licencias_productos
end
