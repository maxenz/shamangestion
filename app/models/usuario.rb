class Usuario < ActiveRecord::Base
  attr_accessible :apellido, :descripcion, :email, :fec_nacimiento, :nombre, :password
end
