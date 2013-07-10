class ClientesLicencia < ActiveRecord::Base
	
	belongs_to :cliente
	belongs_to :licencia

  attr_accessible :cliente_id, :cnn_catalog, :cnn_data_source, :cnn_pass, :cnn_user, :licencia_id
end
