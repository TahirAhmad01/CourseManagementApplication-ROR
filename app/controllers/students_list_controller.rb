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
    @student_enrolled_courses = EnrolledCourse.where(users_id: params[:id])

    if @student_enrolled_courses.empty?
      flash[:error] = "User is not enrolled in any courses for the current semester."
      redirect_to students_list_path(params[:id])
      return
    end

    # Validation to check if marks are provided for all enrolled courses
    # if params[:course_marks].nil? || params[:course_marks].values.any?(&:blank?)
    #   flash[:error] = "Please provide marks for all enrolled courses."
    #   redirect_to students_list_path(params[:id])
    #   return
    # end

    # Iterate through each enrolled course
    @student_enrolled_courses.each do |course|
      marks = params[:course_marks]
      # Create a mark record for the user, semester, and course
      Mark.create(user_id: params[:id], semester_id: course.semester_id, course_id: course.course_id, marks: marks)
    end

    flash[:success] = "Marks given successfully."
    redirect_to students_list_path(params[:id])
  end


  private

  def student
    @student= User.find(params[:id])
  end
end
