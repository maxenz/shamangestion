class Cliente < ActiveRecord::Base

	belongs_to :localidad
	has_many :clientes_contactos, :dependent => :destroy
	has_many :clientes_licencias, :dependent => :destroy
	has_many :clientes_gestiones, :dependent => :destroy
	has_many :licencias, :through => :clientes_licencias
	#has_one  :contacto_principal, :class_name => 'ClientesContacto', :conditions => "flgPrincipal = 1 "

	validates_presence_of :razonSocial
	validates_uniqueness_of :razonSocial

	validates_numericality_of :dmAltura, :allow_nil => true

	validates_numericality_of :dmPiso, :allow_nil => true

	validates_presence_of :localidad_id

    accepts_nested_attributes_for :clientes_licencias, :clientes_gestiones
    accepts_nested_attributes_for :clientes_contactos
  	attr_accessible :dmAltura, :dmCalle, :dmDepto, :dmPiso, :dmReferencia, :domicilio, :fecIngreso, :razonSocial, :sitioWeb, :localidad_id, :clientes_gestiones_attributes,:clientes_contactos_attributes
  	
end
