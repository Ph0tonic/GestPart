class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :title
      t.integer :distribution
      t.integer :no
      t.text :divers
      t.references :publishing_house, foreign_key: true

      t.timestamps
    end

    create_table :pieces_kinds, id: false do |t|
      t.belongs_to :piece, index: true
      t.belongs_to :kind, index: true
    end

  end
end
