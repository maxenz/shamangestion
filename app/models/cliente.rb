class Cliente < ActiveRecord::Base

	belongs_to :localidad
	has_many :clientes_contactos, :dependent => :destroy
	validates :razonSocial, uniqueness: true, presence: true
	validates :dmCalle, :localidad_id, presence: true
	validates :dmAltura, :dmPiso, numericality: true, allow_nil: true
    accepts_nested_attributes_for :clientes_contactos
  	attr_accessible :dmAltura, :dmCalle, :dmDepto, :dmPiso, :dmReferencia, :domicilio, :fecIngreso, :razonSocial, :sitioWeb, :localidad_id, :clientes_contactos
end
