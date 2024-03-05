class StudentsListController < ApplicationController
  before_action :student, only: %i[show mark]

  def index
    @students = User.all
  end

  def show
    @student_enrolled_courses = EnrolledCourse.where(users_id: params[:id])
    @semesters = Semester.all
  end

  def mark
    Rails.logger.debug(params)
    if params[:semester_id].blank?
      redirect_to students_list_path
    else
      @student_enrolled_courses = EnrolledCourse.where(users_id: params[:id], semester_id: params[:semester_id])
    end
    @semesters = Semester.all
  end

  def create_marks
  end


  private

  def student
    @student = User.find(params[:id])
  end
end
