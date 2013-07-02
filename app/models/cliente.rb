class Cliente < ActiveRecord::Base
	belongs_to :localidad
	has_many :clientes_contactos, :dependent => :destroy
    accepts_nested_attributes_for :clientes_contactos
  	attr_accessible :dmAltura, :dmCalle, :dmDepto, :dmPiso, :dmReferencia, :domicilio, :fecIngreso, :razonSocial, :sitioWeb, :localidad_id
end
