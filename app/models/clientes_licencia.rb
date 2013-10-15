class ClientesLicencia < ActiveRecord::Base
	
	belongs_to :cliente
	belongs_to :licencia
	has_many :clientes_licencias_productos, :dependent => :destroy
	has_many :productos, :through => :clientes_licencias_productos
	validates_presence_of :cnn_catalog
	validates_presence_of :cnn_data_source
	validates_presence_of :cnn_pass
	validates_presence_of :cnn_user
	validates_presence_of :licencia_id
	accepts_nested_attributes_for :productos
	
  attr_accessible :cliente_id, :cnn_catalog, :cnn_data_source, :cnn_pass, :cnn_user, :licencia_id, :fecha_de_vencimiento, :conexion_servidor, :clientes_licencias_producto_attributes, :producto_ids
  
end
