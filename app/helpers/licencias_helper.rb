module LicenciasHelper

	def get_estado_licencia licencia
		cliente_licencia = ClientesLicencia.where(["licencia_id = ?", licencia]) 
		estado = ""
		if cliente_licencia.first.nil? 
			estado = "<span style='font-weight:bold;color:green'>Disponible</span>"
		else 
			razon_social = cliente_licencia.first.cliente.razonSocial 
			estado = "<span style='font-weight:bold;color:red'>ASIGNADA A #{razon_social}</span>"
		 end 

		 return estado
	end

	def get_productos_licencia licencia


		str_productos = ""
		licencia.productos.each do |prod|	
			if str_productos == ""

				str_productos = prod.nro_producto.to_s
			else
				str_productos = str_productos + " / " + prod.nro_producto.to_s 
			end
		end
		return str_productos
	end
end
