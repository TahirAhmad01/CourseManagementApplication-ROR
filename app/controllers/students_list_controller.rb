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
    @semesters = Semester.all

    if params[:semester_id].present? && !Semester.exists?(id: params[:semester_id])
      redirect_to students_list_path(@student), alert: "Invalid semester ID"
    else
      semester_find = params[:semester_id].presence || @student.semester.id
      @student_enrolled_courses = EnrolledCourse.where(users_id: params[:id], semester_id: semester_find)
    end
  end


  private

  def student
    @student = User.find(params[:id])
  end
end
