class AddCreditAndDescriptionToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :credit, :integer, null: false, default: 4
    add_column :courses, :description, :text
  end
end
