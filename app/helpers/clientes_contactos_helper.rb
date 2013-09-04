module ClientesContactosHelper

	def set_contacto_principal_star contacto
		if contacto.flgPrincipal == 1
			return "#{contacto.nombre} <i class=\"icon icon-star\"></i>"
		else
			return contacto.nombre
		end
	end

	def set_star_tabla contacto
		if contacto.flgPrincipal == 1
			return "<i class=\"icon icon-star\"></i>"
		else
			return " "
		end
	end		
end
