class Article < ApplicationRecord
  scope :user, -> (user) { where(user_id: user) }
end
