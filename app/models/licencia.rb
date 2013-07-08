class Licencia < ActiveRecord::Base
	has_and_belongs_to_many :productos
	accepts_nested_attributes_for :productos
  attr_accessible :serial, :producto_ids

end
