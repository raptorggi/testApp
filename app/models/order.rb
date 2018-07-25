class Order < ApplicationRecord

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  validates_associated :order_products
  validates :address, presence: true
end
