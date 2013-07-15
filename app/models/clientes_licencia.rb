class ClientesLicencia < ActiveRecord::Base
	
	belongs_to :cliente
	belongs_to :licencia

	validates_presence_of :cnn_catalog
	validates_presence_of :cnn_data_source
	validates_presence_of :cnn_pass
	validates_presence_of :cnn_user
	validates_presence_of :licencia_id
	
  attr_accessible :cliente_id, :cnn_catalog, :cnn_data_source, :cnn_pass, :cnn_user, :licencia_id, :fecha_de_vencimiento
end
