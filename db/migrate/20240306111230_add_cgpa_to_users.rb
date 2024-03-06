class AddCgpaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cgpa, :decimal,precision: 4, scale: 2
  end
end
