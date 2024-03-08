require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'is valid with a course name and credit' do
    semester = Semester.create(semester_name: 'Fall 2024') # Assuming Semester has a 'name' attribute
    course = Course.new(course_name: 'Calculus', credit: 4, semester: semester)
    expect(course).to be_valid
  end

  it 'is invalid without a course name' do
    course = Course.new(course_name: nil)
    course.valid?
    expect(course.errors[:course_name]).to include("can't be blank")
  end

  it 'belongs to a semester' do
    course = Course.reflect_on_association(:semester)
    expect(course.macro).to eql(:belongs_to)
  end
end