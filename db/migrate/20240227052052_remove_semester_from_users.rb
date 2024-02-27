class RemoveSemesterFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :semester, :string
  end
end
