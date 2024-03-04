class AddCreditAndDescriptionToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :credit, :integer, null: false
    add_column :courses, :description, :text
  end
end
