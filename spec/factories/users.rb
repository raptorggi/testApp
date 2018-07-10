FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@testapp.com" }
    password "111111"
    password_confirmation "111111"
  end
end