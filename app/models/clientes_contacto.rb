class ClientesContacto < ActiveRecord::Base

	belongs_to :cliente
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :flgPrincipal,:telefono, numericality: true
	validates :email,:flgPrincipal,:nombre,:telefono, presence: true
  	attr_accessible :email, :flgPrincipal, :nombre, :telefono, :cliente_id

end
