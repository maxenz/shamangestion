class UsuariosCliente < ActiveRecord::Base

	belongs_to :usuario
	belongs_to :cliente

  	attr_accessible :cliente_id, :shaman_express_id, :shaman_full_id, :usuario_id
  
end
