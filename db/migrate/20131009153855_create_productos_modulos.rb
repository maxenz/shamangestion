class CreateProductosModulos < ActiveRecord::Migration
  def change
    create_table :productos_modulos do |t|
      t.string :abreviatura_id
      t.string :descripcion
      t.integer :producto_id

      t.timestamps
    end
  end
end
