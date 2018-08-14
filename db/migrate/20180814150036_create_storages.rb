class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.string :name
      t.string :memo
      t.integer :order
      t.references :storage, foreign_key: true
      t.references :storage_type, foreign_key: true

      t.timestamps
    end
  end
end
