module ApplicationHelper
  def calculate_cgpa(enrolled_courses)
    total_credit_points = 0
    total_credits = 0
    flag = false
    failed_courses = []

    enrolled_courses.each do |enrolled_course|
      if enrolled_course.marks.nil?
        flag = true
      end
      credit = enrolled_course.course.credit
      grade_points = calculate_grade(enrolled_course.marks)

      if grade_points == 0
        total_credits = 0
        break
      else
        total_credit_points += grade_points * credit
        total_credits += credit
      end
    end

    failed_courses.each do |course_name|
      puts "You have failed in #{course_name}"
    end

    if flag
      total_credits = nil
    else
      Rails.logger.debug("====++++++++++===+++++++++++++================================================")
      Rails.logger.debug(total_credits.zero? ? 0 : total_credit_points / total_credits)
      total_credits.zero? ? 0 : total_credit_points / total_credits

    end
  end

  def grade_alpha(cgpa)
    case cgpa
    when 3.75..4.00
      'A+'
    when 3.50..3.74
      'A'
    when 3.25..3.49
      'A-'
    when 3.00..3.24
      'B+'
    when 2.75..2.99
      'B'
    when 2.50..2.74
      'B-'
    when 2.25..2.49
      'C+'
    when 2.00..2.24
      'C'
    when 1.75..1.99
      'C-'
    when 1.50..1.74
      'D+'
    when 1.00..1.49
      'D'
    else
      'F'
    end
  end

  def total_result
    if user_signed_in?
      enrolled_courses = EnrolledCourse.where(users_id: current_user.id)
    else
      enrolled_courses = EnrolledCourse.where(users_id: params[:id])
    end
    unique_semesters = enrolled_courses.select(:semester_id).distinct
    semesters = Semester.all
    total_gpa = 0.0
    total_credit_hours = 0
    enrolled_courses_exits = false

    all_semesters_exist = semesters.pluck(:id).all? { |semester_id| unique_semesters.pluck(:semester_id).include?(semester_id) }

    if all_semesters_exist
      enrolled_courses.each do |enrolled_course|
        if enrolled_course.marks.present?
          total_gpa += calculate_grade(enrolled_course.marks) * enrolled_course.course.credit
          total_credit_hours += enrolled_course.course.credit
          enrolled_courses_exits = true
        else
          enrolled_courses_exits = false
          break
        end
      end

      if enrolled_courses_exits
        total_cgpa = calculate_cgpa(enrolled_courses)
        user = User.where(id: params[:id])
        user.update(cgpa: total_cgpa)
        return total_cgpa
      else
        return "result is pending"
      end

    else
      Rails.logger.debug("Not all semester IDs exist in unique semesters.")
      return "result is pending"
    end
  end

  private

  def calculate_grade(score)
    case score
    when 80..100
      4.00
    when 75..79
      3.75
    when 70..74
      3.50
    when 65..69
      3.25
    when 60..64
      3.00
    when 55..59
      2.75
    when 50..54
      2.50
    when 45..49
      2.25
    when 40..44
      2.00
    else
      0.00
    end
  end
end
