class UserpanelController < ApplicationController
  def index
    @semesters = Semester.all
    @courses = Course.where(semester_id: current_user.semester_id)
    @enrolled_courses = EnrolledCourse.where(semester_id: current_user.semester_id, users_id: current_user.id)
  end

  def search_courses
    query = params[:query]
    if query.present?
      @courses = Course.where(semester_id: current_user.semester_id).where('course_name LIKE ?', "%#{query}%")
    else
      @courses = Course.where(semester_id: current_user.semester_id)
    end
    @enrolled_courses = EnrolledCourse.where(semester_id: current_user.semester_id, users_id: current_user.id)

    render partial: 'userpanel/courses_list', locals: { courses: @courses, enrolled_courses: @enrolled_courses }
  end
end
