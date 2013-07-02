class CreateClientesContactos < ActiveRecord::Migration
  def change
    create_table :clientes_contactos do |t|
      t.string :nombre
      t.string :email
      t.integer :flgPrincipal
      t.string :telefono
      t.belongs_to :cliente

      t.timestamps
    end
  end
end
