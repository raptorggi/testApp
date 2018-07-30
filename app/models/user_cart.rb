class UserCart < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product_id, :user_token, :quantity, presence: true
end
