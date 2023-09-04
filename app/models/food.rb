class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250, too_long: '%<count>s characters is the maximum allowed' }
  validates :measurement_unit, presence: true, length: { maximum:50, '%<count>s characters is the maximum allowed' }
  validates :price, presence: true
end
