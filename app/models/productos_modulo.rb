class ProductosModulo < ActiveRecord::Base

	belongs_to :producto

  attr_accessible :abreviatura_id, :descripcion, :producto_id
end
