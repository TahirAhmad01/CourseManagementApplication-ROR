class CreateMarks < ActiveRecord::Migration[7.1]
  def change
    create_table :marks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.integer :marks

      t.timestamps
    end
  end
end
