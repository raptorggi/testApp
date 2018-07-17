class User < ApplicationRecord
  attr_accessor :password
  
  has_many :user_carts
  has_many :products, :through => :user_carts

  validates :name, presence: :true, length: { maximum: 50 }
  validates :email, presence: :true, length: { maximum: 50 } , uniqueness: { case_sensitive: false }
  validates :password, presence: :true, length: { within: 6..40 }, confirmation: :true
  before_save :encrypt_password

  private
  def encrypt_password
    self.password_hash = Digest::SHA2.hexdigest(password)
  end  
end
