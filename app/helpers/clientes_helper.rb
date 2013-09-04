module ClientesHelper

	def check_length str,cant

		if str.length > cant
			return str[0..cant] << " ..."
		else
			return str
		end
	end
end
