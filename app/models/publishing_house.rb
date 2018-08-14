class PublishingHouse < ApplicationRecord
  has_many :piece
  validates :name, presence: true,
                    length: { minimum: 1 }
end
