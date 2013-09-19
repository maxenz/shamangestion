class ChangeShamanIdType < ActiveRecord::Migration
  def self.up
   change_column :usuarios_clientes, :shaman_full_id, :string
   change_column :usuarios_clientes, :shaman_express_id, :string
  end

  def self.down
	change_column :usuarios_clientes, :shaman_full_id, :integer
	change_column :usuarios_clientes, :shaman_full_id, :integer
  end
end
