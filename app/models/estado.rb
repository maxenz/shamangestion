class Estado < ActiveRecord::Base

  has_many :clientes_gestiones, :dependent => :restrict
  attr_accessible :descripcion, :nro_estado

  validates_presence_of :nro_estado
  validates_numericality_of :nro_estado
  validates_uniqueness_of :nro_estado

  validates_presence_of :descripcion
  validates_uniqueness_of :descripcion

  
end
