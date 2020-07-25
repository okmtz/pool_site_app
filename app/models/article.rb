class Article < ApplicationRecord
  has_many :url_contents, dependent: :destroy
  scope :user, -> (user) { where(user_id: user) }
end
