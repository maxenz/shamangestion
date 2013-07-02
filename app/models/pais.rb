class Pais < ActiveRecord::Base

  has_many :provincias, dependent: :destroy
  validates :codigo, presence: true, length: {maximum: 3}, uniqueness: true
  validates :descripcion, presence: true, uniqueness: true
  attr_accessible :codigo, :descripcion

end
