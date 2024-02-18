class CreateSemesters < ActiveRecord::Migration[7.1]
  def change
    create_table :semesters do |t|
      t.string :semester_name

      t.timestamps
    end
  end
end
