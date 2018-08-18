class CreateVoices < ActiveRecord::Migration[5.2]
  def change
    create_table :voices do |t|
      t.string :name
      t.integer :number
      t.string :key
      t.integer :order

      t.timestamps
    end
  end
end
