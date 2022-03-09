FactoryBot.define do
  factory :user do
    id { 2 }
    email { 'hello@example.com' }
    password { 'password123' }
  end
end
