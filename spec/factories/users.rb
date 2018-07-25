FactoryBot.define do
  factory :user do
    name 'user'
    second_name 'test'
    phone '+70000000000'
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
