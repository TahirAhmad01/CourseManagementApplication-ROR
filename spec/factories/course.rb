FactoryBot.define do
  factory :course do
    course_name { "Introduction to Ruby on Rails" }
    description { "A beginner's guide to Ruby on Rails development" }
    credit { 4 }
    semester { association :semester }
  end
end

