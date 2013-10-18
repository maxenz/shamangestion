module LicenciasLogsHelper
	def get_cliente_if_exists log

		licencia = log.licencia
		if licencia.nil?
			return "CLIENTE SIN LICENCIA"
		else
			return licencia.cliente.razonSocial
		end
	end
	
		def get_licencia_if_exists log
	
			licencia = log.licencia
			if licencia.nil?
				return "CLIENTE SIN LICENCIA"
			else
				return licencia.serial
			end
	end
end