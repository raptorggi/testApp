class Order < ApplicationRecord
  VALIDATABLE_ATTRS = ['name', 'surname', 'address', 'phone', 'email']
  validates_presence_of VALIDATABLE_ATTRS
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_length_of :name, :surname, :maximum => 60
  validates_length_of :phone, :minimum => 10, :maximum => 15
  has_many :order_products
  accepts_nested_attributes_for :order_products
  validates_associated :order_products
  has_many :products, :through => :order_products
end
