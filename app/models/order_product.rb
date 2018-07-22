class OrderProduct < ApplicationRecord
  validates :count, presence: true
  belongs_to :product
  belongs_to :order
end
