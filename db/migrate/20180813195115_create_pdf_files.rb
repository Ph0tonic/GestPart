class CreatePdfFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :pdf_files do |t|
      t.string :name
      t.string :attachement

      t.timestamps
    end
  end
end
