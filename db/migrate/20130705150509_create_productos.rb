class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.integer :nro_producto
      t.string :descripcion

      t.timestamps
    end
  end
end
