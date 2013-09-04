class TipoTerminal < ActiveRecord::Base

    has_many :clientes_terminales, :dependent => :destroy

    validates_presence_of :descripcion

  	attr_accessible :descripcion, :clientes_terminales_attributes

end
