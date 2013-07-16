class Pais < ActiveRecord::Base

	has_many :provincias, :dependent => :destroy

	validates_presence_of :codigo
	validates_uniqueness_of :codigo, :case_sensitive => false
	validates_length_of :codigo, :is => 3, :message => "Deben ser 3 caracteres exactamente."

	validates_presence_of :descripcion
	validates_uniqueness_of :descripcion, :case_sensitive => false
	
	attr_accessible :codigo, :descripcion

end
