require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a first name, last name, and birthdate' do
    semester = Semester.create(id:1, semester_name: 'Fall 2024')
    user = User.new(id:1, first_name: 'Alice', last_name: 'Smith', email: 'alicesmith@example.com', password: 'password', birthdate: '1985-05-30', semester_id: 1, gender: 0)
    expect(user).to be_valid
  end

  it 'is invalid without a birthdate' do
    user = User.new(birthdate: nil)
    user.valid?
    expect(user.errors[:birthdate]).to include("can't be blank")
  end
end