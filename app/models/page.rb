class Page < ApplicationRecord
  extend FriendlyId
  
  friendly_id :title, :use => [:finders, :slugged]
  validates :title, :text, presence: true
end
