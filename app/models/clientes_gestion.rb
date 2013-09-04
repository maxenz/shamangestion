class ClientesGestion < ActiveRecord::Base

    belongs_to :cliente
	belongs_to :estado

	validates_presence_of :estado
	validates_presence_of :fecha

  	attr_accessible :cliente_id, :estado_id, :fecha, :observaciones, :estado_attributes

end
