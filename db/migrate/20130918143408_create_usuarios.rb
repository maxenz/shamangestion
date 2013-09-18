class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :descripcion
      t.string :password
      t.string :email
      t.string :nombre
      t.string :apellido
      t.date :fec_nacimiento

      t.timestamps
    end
  end
end
