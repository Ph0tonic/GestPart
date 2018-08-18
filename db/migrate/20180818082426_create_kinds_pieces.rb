class CreateKindsPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :kinds_pieces, id: false do |t|
      t.references :kind, null: false
      t.references :piece, null: false
    end

    # Add an unique index for better join speed!
    add_index(:kinds_pieces, [:kind_id, :piece_id], :unique => true)
  end
end
