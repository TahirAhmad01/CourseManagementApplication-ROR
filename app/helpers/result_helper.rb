module ResultHelper
  def total_result
    enrolled_courses = EnrolledCourse.where(users_id: current_user.id)
    unique_semesters = enrolled_courses.select(:semester_id).distinct
    semesters = Semester.all
    total_gpa = 0.0
    total_credit_hours = 0

    all_semesters_exist = semesters.pluck(:id).all? { |semester_id| unique_semesters.pluck(:semester_id).include?(semester_id) }

    if all_semesters_exist
      enrolled_courses.each do |enrolled_course|
        if enrolled_course.marks.present?
          total_gpa += calculate_grade(enrolled_course.marks) * enrolled_course.course.credit
          total_credit_hours += enrolled_course.course.credit
        end
      end

      total_cgpa = calculate_cgpa( enrolled_courses)
      Rails.logger.debug("Total CGPA: #{total_cgpa}")
      total_cgpa
    else
      Rails.logger.debug("Not all semester IDs exist in unique semesters.")
      "result is pending"
    end
  end
end
