class Order < ApplicationRecord
  VALIDATABLE_ATTRS = %w[name surname address phone email].freeze

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  validates_associated :order_products
  validates presence: VALIDATABLE_ATTRS
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, :surname, length: { maximum: 60 }
  validates :phone, length: { minimum: 10, maximum: 15 }
end
