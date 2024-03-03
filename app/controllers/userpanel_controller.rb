class UserpanelController < ApplicationController
  def index
    @semesters = Semester.all
    @courses = Course.where(semester_id: current_user.semester_id)
    @enrolled_courses = EnrolledCourse.where(semester_id: current_user.semester_id, users_id: current_user.id)
  end
end
