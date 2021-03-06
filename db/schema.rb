# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131010193554) do

  create_table "clientes", :force => true do |t|
    t.string   "razonSocial"
    t.string   "dmCalle"
    t.integer  "dmAltura"
    t.integer  "dmPiso"
    t.string   "dmDepto"
    t.string   "dmReferencia"
    t.string   "domicilio"
    t.string   "sitioWeb"
    t.date     "fecIngreso"
    t.integer  "localidad_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "clientes_contactos", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "flgPrincipal"
    t.string   "telefono"
    t.integer  "cliente_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "clientes_gestiones", :force => true do |t|
    t.integer  "estado_id"
    t.integer  "cliente_id"
    t.date     "fecha"
    t.text     "observaciones"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "clientes_licencias", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "licencia_id"
    t.string   "cnn_data_source"
    t.string   "cnn_catalog"
    t.string   "cnn_user"
    t.string   "cnn_pass"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.date     "fecha_de_vencimiento"
    t.string   "conexion_servidor"
  end

  create_table "clientes_licencias_productos", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "clientes_licencia_id"
    t.integer  "producto_id"
  end

  create_table "clientes_licencias_productos_productos_modulos", :force => true do |t|
    t.integer  "clientes_licencias_producto_id"
    t.integer  "productos_modulo_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "clientes_terminales", :force => true do |t|
    t.integer  "tipo_terminal_id"
    t.integer  "cliente_id"
    t.string   "valor1"
    t.string   "valor2"
    t.string   "valor3"
    t.string   "valor4"
    t.string   "referencia"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "estados", :force => true do |t|
    t.integer  "nro_estado"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "licencias", :force => true do |t|
    t.string   "serial"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "licencias_logs", :force => true do |t|
    t.integer  "licencia_id"
    t.date     "log_fecha_hora"
    t.integer  "solicitud_id"
    t.string   "ip"
    t.string   "referencias"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "licencias_productos", :id => false, :force => true do |t|
    t.integer "licencia_id"
    t.integer "producto_id"
  end

  create_table "localidades", :force => true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.integer  "provincia_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "paises", :force => true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "productos", :force => true do |t|
    t.integer  "nro_producto"
    t.string   "descripcion"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "productos_modulos", :force => true do |t|
    t.string   "abreviatura_id"
    t.string   "descripcion"
    t.integer  "producto_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "provincias", :force => true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.integer  "pais_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipo_terminales", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "usuarios", :force => true do |t|
    t.string   "descripcion"
    t.string   "password"
    t.string   "email"
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fec_nacimiento"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "usuarios_clientes", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "cliente_id"
    t.string   "shaman_full_id"
    t.string   "shaman_express_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
