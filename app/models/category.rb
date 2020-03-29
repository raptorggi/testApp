class Category < ApplicationRecord
  extend FriendlyId
  validates :name_ru, :name_en, presence: true
  friendly_id :name_en, use: :slugged
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy
  has_many :products, dependent: :destroy

  scope :root, -> { where parent_id: nil }

  scope :search_category, -> (name) {
    /[а-я]/.match(name) ? lang = 'ru' : lang = 'en'
    where("name_#{lang} ILIKE ? ", "%#{name}%")
  }
end
