class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[vkontakte]

  has_many :user_carts
  has_many :orders

  validates :name, :last_name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, :last_name, length: { maximum: 60 }
  validates :phone, length: { maximum: 15 }

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.vkontakte_data"] && session["devise.vkontakte_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
