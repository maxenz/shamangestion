class ClientesContacto < ActiveRecord::Base
	belongs_to :cliente
	
  attr_accessible :email, :flgPrincipal, :nombre, :telefono, :cliente_id
end
