class AddStorageToPieces < ActiveRecord::Migration[5.2]
  def change
    add_reference :pieces, :storage, foreign_key: true
  end
end
