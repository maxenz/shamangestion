class ClientesContacto < ActiveRecord::Base

	belongs_to :cliente
	
	validates_presence_of :flgPrincipal
	validates_presence_of :nombre

	validates_numericality_of :flgPrincipal

  	attr_accessible :email, :flgPrincipal, :nombre, :telefono, :cliente_id

end
