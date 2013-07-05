class CreateLicencias < ActiveRecord::Migration
  def change
    create_table :licencias do |t|
      t.string :serial

      t.timestamps
    end
  end
end
