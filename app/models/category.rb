class Category < ApplicationRecord
  extend FriendlyId
  validates :name, presence: true
  friendly_id :name, use: :slugged
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy
  has_many :products, dependent: :destroy

  scope :root, -> { where parent_id: nil }
end
