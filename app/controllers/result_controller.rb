class ResultController < ApplicationController
  def index
    @student = User.find(current_user.id)
    @semesters = Semester.all
    @student_enrolled_courses = EnrolledCourse.where(users_id: current_user.id)
  end
end
