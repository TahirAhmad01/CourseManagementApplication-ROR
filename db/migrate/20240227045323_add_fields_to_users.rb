class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :birthdate, :date
    add_column :users, :semester, :integer
  end
end
