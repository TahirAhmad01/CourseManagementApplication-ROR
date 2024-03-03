class Course < ApplicationRecord
  belongs_to :semester
  has_one_attached :course_image

  validates :course_name, presence: true
end
