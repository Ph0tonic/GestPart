class Storage < ApplicationRecord
  belongs_to :type
  validates :type, presence: true
  belongs_to :storage
  has_many :storage
end
