class Piece < ApplicationRecord
  belongs_to :publishing_house, optional: true
  belongs_to :storage, optional: true
  has_and_belongs_to_many :kind
  has_many :pdf_files
  attr_accessor :pdf_file_data
  validates :title, presence: true,
                    length: { minimum: 1 }
end
