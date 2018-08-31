class Storage < ApplicationRecord
  belongs_to :storage_type
  validates :storage_type, presence: true
  belongs_to :storage, optional: true
  has_many :storages
end
