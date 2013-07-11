class Licencia < ActiveRecord::Base

	has_and_belongs_to_many :productos
	has_many :licencias_logs
	has_one :clientes_licencia
	has_one :cliente, :through => :clientes_licencia
	accepts_nested_attributes_for :productos
  	attr_accessible :serial, :producto_ids, :clientes_licencia_attributes

end
