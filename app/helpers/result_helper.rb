module ResultHelper
  def total_result_r
    enrolled_courses = EnrolledCourse.where(users_id: current_user.id)
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
        total_cgpa = calculate_cgpa( enrolled_courses)
        current_user.update(cgpa: total_cgpa)
        return total_cgpa
      else
        return "result is pending"
      end

    else
      Rails.logger.debug("Not all semester IDs exist in unique semesters.")
      return "result is pending"
    end
  end
end
