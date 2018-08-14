class StorageType < ApplicationRecord
  mount_uploader :icon, IconUploader
  has_may :storage
end
