class CreateLicencia < ActiveRecord::Migration
  def change
    create_table :licencias do |t|
      t.string :serial

      t.timestamps
    end

  	create_table :licencias_productos do |t|
  		t.integer :licencia_id
  		t.integer :producto_id

  		t.timestamps
  	end

  	create_table :licencias_logs do |t|

  		t.integer :licencia_id
  		t.date :log_fecha_hora
  		t.integer :solicitud_id
  		t.string :ip
  		t.string :referencias

  		t.timestamps
  	end

  	create_table :clientes_licencias do |t|

  		t.integer :cliente_id
  		t.integer :licencia_id
  		t.string :cnn_data_source
  		t.string :cnn_catalog
  		t.string :cnn_user
  		t.string :ccn_password

  		t.timestamps
  	end

  end
end
