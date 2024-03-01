class StudentsListController < ApplicationController
  before_action :student, only: %i[show mark create_marks]

  def index
    @students = User.all
  end

  def show
    @student_enrolled_courses = EnrolledCourse.where(users_id: params[:id])
    @semesters = Semester.all
  end

  def mark
    @student_enrolled_courses = EnrolledCourse.where(users_id: params[:id], semester_id: @student.semester.id)
    @semesters = Semester.all
  end

  def create_marks
    Rails.logger.error(params)
    marks_params = params[:marks]
    course_ids = params[:course_ids]

    # marks_params.each do |course_id, mark|
    #   Rails.logger.debug(course_id)
    #   if course_ids[course_id.to_i].present? and mark.present?
    #
    #     Mark.create(user_id: params[:id], semester_id: @student.semester.id, course_id: course_ids[course_id.to_i], marks: mark)
    #   else
    #     Rails.logger.error("Course ID is missing for mark: #{mark}")
    #   end
    # end
    #
    # redirect_to mark_students_path, notice: 'Marks were successfully submitted.'
  end




  private

  def student
    @student = User.find(params[:id])
  end
end
