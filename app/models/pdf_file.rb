class PdfFile < ApplicationRecord
  mount_uploader :file_id, DropboxPdfUploader
  belongs_to :piece
  has_many :voices, through: :pdf_voices
end
