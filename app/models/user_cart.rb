class UserCart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product

  validates :product_id, :user_token, :quantity, presence: true
end
