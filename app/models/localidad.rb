class Localidad < ActiveRecord::Base

  belongs_to :provincia
  has_many :clientes, :dependent => :restrict
  validates :codigo, presence: true, length: {maximum: 3}, uniqueness: true
  validates :descripcion, presence: true, uniqueness: true
  attr_accessible :codigo, :descripcion, :provincia_id

end
