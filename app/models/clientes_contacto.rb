class ClientesContacto < ActiveRecord::Base

	belongs_to :cliente
	
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_numericality_of :telefono
	validates_numericality_of :flgPrincipal

	validates_presence_of :flgPrincipal
	validates_presence_of :nombre

  	attr_accessible :email, :flgPrincipal, :nombre, :telefono, :cliente_id

end
