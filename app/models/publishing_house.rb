class PublishingHouse < ApplicationRecord
  has_many :pieces
  validates :name, presence: true,
                    length: { minimum: 1 }
end
