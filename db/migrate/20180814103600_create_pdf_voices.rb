class CreatePdfVoices < ActiveRecord::Migration[5.2]
  def change
    create_table :pdf_voices do |t|
      t.belongs_to :pdf_file, index: true
      t.belongs_to :voice, index: true
      t.integer :start_page
      t.integer :nb_page
      t.timestamps
    end
  end
end
