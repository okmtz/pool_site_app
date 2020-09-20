# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :line_link_nonce, dependent: :destroy
  has_many :user_line_ids, dependent: :destroy

  def admin?
    return true if id == 1

    false
  end

  def self.save_line_user_id(nonce, line_user_id)
    link_user = LineLinkNonce.find_by(nonce: nonce).user
    UserLineId.create(line_user_id: line_user_id, user_id: link_user.id)
  end
end
