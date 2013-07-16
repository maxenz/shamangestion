class Provincia < ActiveRecord::Base

	has_many :localidades, :dependent => :destroy
	belongs_to :pais

	validates_presence_of :codigo
	validates_uniqueness_of :codigo, :case_sensitive => false
	validates_length_of :codigo, :is => 3, :message => "Deben ser 3 caracteres exactamente."

	validates_uniqueness_of :descripcion, :case_sensitive => false
	validates_presence_of :descripcion

	attr_accessible :codigo, :descripcion, :pais_id
  	
end
