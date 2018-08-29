class PdfFile < ApplicationRecord
  mount_uploader :attachement, DropboxPdfUploader
  belongs_to :piece
  validates :piece, presence: true
  has_many :pdf_voices
  has_many :voices, through: :pdf_voices
end
