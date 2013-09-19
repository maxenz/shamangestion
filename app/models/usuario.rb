class Usuario < ActiveRecord::Base

	has_many :usuarios_clientes, :dependent => :destroy
	has_many :clientes, through: :usuarios_clientes

  	attr_accessible :apellido, :descripcion, :email, :fec_nacimiento, :nombre, :password

end
