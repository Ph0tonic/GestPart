class Voice < ApplicationRecord
  has_many :pdf_voices
  has_many :pdf_files, through: :pdf_voices
end
