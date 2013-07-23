module LicenciasLogsHelper
	def get_cliente_if_exists log

		cliente = log.licencia.cliente
		if cliente.nil?
			return "CLIENTE SIN LICENCIA"
		else
			return cliente.razonSocial
		end

	end
end
