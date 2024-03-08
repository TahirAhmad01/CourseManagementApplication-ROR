FactoryBot.define do
  factory :enrolled_courses do
    course { association :course }
    semester { association :semester }
    users { association :user }
    marks { nil }
  end
end