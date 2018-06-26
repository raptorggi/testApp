class Product < ApplicationRecord
  extend FriendlyId
  validates :name, presence: true
  friendly_id :name, use: :slugged
  has_attached_file :image, default_url: "/img/default.jpg"
  belongs_to :category
end
