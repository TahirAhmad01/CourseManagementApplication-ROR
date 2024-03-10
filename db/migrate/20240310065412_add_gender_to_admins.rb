class AddGenderToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :gender, :integer
  end
end
