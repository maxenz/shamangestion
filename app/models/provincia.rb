class Provincia < ActiveRecord::Base

	has_many :localidades, :dependent => :destroy
	belongs_to :pais
	validates :codigo, presence: true, length: {maximum: 3}, uniqueness: true
  	validates :descripcion, presence: true, uniqueness: true
  	attr_accessible :codigo, :descripcion, :pais_id
  	
end
