class Article < ApplicationRecord
  has_many :url_data
  scope :user, -> (user) { where(user_id: user) }
end
