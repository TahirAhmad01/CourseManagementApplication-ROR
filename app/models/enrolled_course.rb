class EnrolledCourse < ApplicationRecord
  belongs_to :course
  belongs_to :semester

  validates :users_id, presence: true
  validates :course_id, uniqueness: { scope: :users_id, message: "has already been enrolled by the user" }
end
