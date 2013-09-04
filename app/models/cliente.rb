class Cliente < ActiveRecord::Base

	belongs_to :localidad
	has_many :clientes_contactos, :dependent => :destroy
	has_many :clientes_licencias, :dependent => :destroy
	has_many :clientes_gestiones, :dependent => :destroy
	has_many :clientes_terminales, :dependent => :destroy
	has_many :licencias, :through => :clientes_licencias

	validates_presence_of :razonSocial
	validates_uniqueness_of :razonSocial

	validates_numericality_of :dmAltura, :allow_nil => true

	validates_numericality_of :dmPiso, :allow_nil => true

	validates_presence_of :localidad_id

	validates_presence_of :clientes_contactos

    accepts_nested_attributes_for :clientes_licencias, :clientes_gestiones, :clientes_contactos, :clientes_terminales
  	attr_accessible :dmAltura, :dmCalle, :dmDepto, :dmPiso, :dmReferencia, :domicilio, :fecIngreso, :razonSocial, :sitioWeb, :localidad_id, :clientes_gestiones_attributes,:clientes_contactos_attributes,:clientes_licencias_attributes,:clientes_terminales_attributes
  	
end
