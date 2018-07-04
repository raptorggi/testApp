class Product < ApplicationRecord
  extend FriendlyId
  validates :name, presence: true
  friendly_id :name, use: :slugged
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }, default_url: "/img/default.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :category
  has_many :order_products
  has_many :orders, :through => :order_products
end
