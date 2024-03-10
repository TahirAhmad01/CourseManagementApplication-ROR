class Semester < ApplicationRecord
  has_many :courses
  has_many :users

  validates :semester_name, presence: true
end
