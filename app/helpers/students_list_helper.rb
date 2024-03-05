module StudentsListHelper
  def calculate_total_cgpa_for_student(student, semesters)
    total_cgpa = 0.0
    count = 0

    semesters.each do |semester|
      enrolled_courses_for_semester = student.enrolled_courses.where(semester_id: semester.id)
      if enrolled_courses_for_semester.any?
        total_cgpa += calculate_cgpa(enrolled_courses_for_semester)
        count += 1
      end
    end

    if count == 0
      "Result pending"
    elsif total_cgpa == 0
      "You have to pass every semester"
    else
      '%.2f' % (total_cgpa / count)
    end
  end
end
