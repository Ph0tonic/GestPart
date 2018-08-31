class PdfVoice < ApplicationRecord
  belongs_to :pdf_file
  belongs_to :voice
  has_many :pieces, through: :pdf_files
end
