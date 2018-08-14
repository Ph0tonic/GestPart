class CreateStorageTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :storage_types do |t|
      t.string :name
      t.string :icon
      t.text :description

      t.timestamps
    end
  end
end
