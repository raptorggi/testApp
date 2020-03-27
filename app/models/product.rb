class Product < ApplicationRecord
  extend FriendlyId
  belongs_to :category
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :user_carts, dependent: :destroy

  validates :name_ru, :name_en, :quantity, :reserved, presence: true
  friendly_id :name_en, use: :slugged

  has_attached_file :image, styles: { small: '64x64', med: '100x100', large: '200x200' }, default_url: '/img/default.jpg'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def left
    quantity - reserved
  end

  scope :search_product, -> (name) {
    /[а-я]/.match(name) ? lang = 'ru' : lang = 'en'
    where("name_#{lang} ILIKE ? ", "%#{name}%")
  }
end
