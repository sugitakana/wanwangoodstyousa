class Tag < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
