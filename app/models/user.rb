class User < ApplicationRecord
  include AuthHelper

  attr_accessor :password

  has_many :user_carts, dependent: :destroy
  has_many :products, through: :user_carts

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { within: 6..40 }, confirmation: true
  before_save :encrypt_password

  private

  def encrypt_password
    self.password_hash = encode(password)
  end
end
