class Piece < ApplicationRecord
  belongs_to :publishing_house, optional: true
  belongs_to :storage, optional: true
  has_and_belongs_to_many :genres
  has_many :pdf_files
  has_many :pdf_voices, through: :pdf_files
  has_many :compositors, through: :compositions
  has_many :compositions
  attr_accessor :pdf_file_data
  validates :title, presence: true,
                    length: { minimum: 1 }
end
