class Page < ApplicationRecord
  validates :slug, :title, :text, presence: :true
end
