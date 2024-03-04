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

  private

  def calculate_cgpa(enrolled_courses)
    total_credit_points = 0
    total_credits = 0

    enrolled_courses.each do |enrolled_course|
      next if enrolled_course.marks.nil?

      grade = calculate_grade(enrolled_course.marks)
      credit = enrolled_course.course.credit

      case grade
      when 'A+' then gp = 4.00
      when 'A' then gp = 3.75
      when 'A-' then gp = 3.50
      when 'B+' then gp = 3.25
      when 'B' then gp = 3.00
      when 'B-' then gp = 2.75
      when 'C+' then gp = 2.50
      when 'C' then gp = 2.25
      when 'D' then gp = 2.00
      else gp = 0.00
      end

      total_credit_points += gp * credit
      total_credits += credit
    end

    total_credits.zero? ? 0 : total_credit_points / total_credits
  end
end

