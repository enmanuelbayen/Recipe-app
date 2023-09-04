class User < ApplicationRecord
has_many :foods
has_many :recipes

validates :name, presence: true, length: { maximum: 250, too_long: '%<count>s characters is the maximum allowed' }
end
