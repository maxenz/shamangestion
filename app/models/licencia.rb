class Licencia < ActiveRecord::Base
	has_many_and_belongs_to_many :productos

  attr_accessible :serial, :licencias_productos

end
