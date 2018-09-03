class Compositor < ApplicationRecord
  has_many :pieces, through: :compositions
  has_many :arrangers
end
