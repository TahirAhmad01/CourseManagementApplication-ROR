class ResultController < ApplicationController
  def index
    @student = current_user
    @semesters = Semester.all
    @semester_results = {}

    @semesters.each do |semester|
      student_enrolled_courses_for_semester = @student.enrolled_courses.where(semester_id: semester.id)
      next if student_enrolled_courses_for_semester.empty?

      semester_result = {
        enrolled_courses: student_enrolled_courses_for_semester,
        cgpa: calculate_cgpa(student_enrolled_courses_for_semester)
      }
      @semester_results[semester] = semester_result
    end
  end


end

