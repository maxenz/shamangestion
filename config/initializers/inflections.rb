# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'pais', 'paises'
  inflect.irregular 'provincia', 'provincias'
  inflect.irregular 'localidad', 'localidades'
  inflect.irregular 'cliente','clientes'
  inflect.irregular 'clienteContacto','clienteContactos'
  inflect.irregular 'licencia','licencias'
 end


