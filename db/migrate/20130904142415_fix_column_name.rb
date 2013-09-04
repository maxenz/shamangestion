class FixColumnName < ActiveRecord::Migration
  def change
    change_table :clientes_terminales do |t|
      t.rename :tipo_id, :tipo_terminal_id
    end
  end
end
