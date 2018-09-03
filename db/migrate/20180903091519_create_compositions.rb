class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.references :piece, foreign_key: true
      t.references :compositor, foreign_key: true
      t.boolean :author

      t.timestamps
    end
  end
end
