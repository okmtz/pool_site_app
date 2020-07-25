class Article < ApplicationRecord
  has_many :url_contents
  scope :user, -> (user) { where(user_id: user) }
end
