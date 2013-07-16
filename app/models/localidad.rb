class Localidad < ActiveRecord::Base

	belongs_to :provincia
	has_many :clientes, :dependent => :restrict

	validates_presence_of :codigo
	validates_uniqueness_of :codigo, :case_sensitive => false
	validates_length_of :codigo, :is => 3, :message => "Deben ser 3 caracteres exactamente."

	validates_uniqueness_of :descripcion, :case_sensitive => false
	validates_presence_of :descripcion

	attr_accessible :codigo, :descripcion, :provincia_id

end
