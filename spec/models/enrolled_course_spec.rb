require 'rails_helper'

RSpec.describe EnrolledCourse, type: :model do
  it 'does not allow a user to enroll in the same course twice' do
    semester = Semester.create!(id:1, semester_name: 'Spring 2024')
    user = User.create!(id:1, first_name: 'Jane', last_name: 'Doe', email: 'janedoe@example.com', password: 'password', birthdate: '1990-01-01', semester_id: 1)
    course = Course.create!(id:1, course_name: 'Physics', credit: 3, semester_id: 1)
    EnrolledCourse.create!(course_id: 1, users_id: 1, semester_id: 1)

    duplicate_enrollment = EnrolledCourse.new(course_id: 1, users_id: 1, semester_id: 1)
    duplicate_enrollment.valid?

    expect(duplicate_enrollment.errors[:course_id]).to include("has already been enrolled by the user")
  end
end