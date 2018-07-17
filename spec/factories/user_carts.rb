FactoryBot.define do
  factory :user_cart do
    user
    product
    quantity 1
  end
end
