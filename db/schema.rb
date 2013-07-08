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

ActiveRecord::Schema.define(:version => 20130705175844) do

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

  create_table "clientes_licencias", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "licencia_id"
    t.string   "cnn_data_source"
    t.string   "cnn_catalog"
    t.string   "cnn_user"
    t.string   "ccn_password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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

  create_table "provincias", :force => true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.integer  "pais_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
