FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    birthdate { "2000-01-01" }
    email { "user@example.com" }
    password { "password" }
    semester
  end
end