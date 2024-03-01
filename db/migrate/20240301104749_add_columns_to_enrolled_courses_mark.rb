class AddColumnsToEnrolledCoursesMark < ActiveRecord::Migration[7.1]
  def change
    add_column :enrolled_courses, :marks, :numeric
  end
end
