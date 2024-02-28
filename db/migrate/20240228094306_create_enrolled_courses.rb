class CreateEnrolledCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :enrolled_courses do |t|
      t.integer :users_id
      t.references :course, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
