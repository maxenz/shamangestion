class ClientesTerminal < ActiveRecord::Base

	belongs_to :cliente
	belongs_to :tipo_terminal

	validates_presence_of :cliente
	validates_presence_of :tipo_terminal
	validates_presence_of :valor1

  	attr_accessible :cliente_id, :referencia, :tipo_terminal_id, :valor1, :valor2, :valor3, :valor4, :cliente_attributes,:tipo_terminal_attributes

end
