FactoryBot.define do
  factory :user do
    name { 'Test' }
    email { 'test@example.com' }
    password { '123456' }
  end
end
