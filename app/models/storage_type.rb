class StorageType < ApplicationRecord
  mount_uploader :icon, IconUploader
  has_many :storage
end
