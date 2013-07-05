class LicenciasProducto < ActiveRecord::Base
	belongs_to :licencia
	belongs_to :producto
	attr_accesible :licencia_id, :producto_id

end