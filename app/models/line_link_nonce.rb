class LineLinkNonce < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
