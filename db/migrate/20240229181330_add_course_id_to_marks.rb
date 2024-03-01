class AddCourseIdToMarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :marks, :course, null: false, foreign_key: true
  end
end
