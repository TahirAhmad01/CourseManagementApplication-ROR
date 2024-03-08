require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'is valid with a first name and last name' do
    admin = Admin.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password')
    expect(admin).to be_valid
  end

  it 'is invalid without a first name' do
    admin = Admin.new(first_name: nil)
    admin.valid?
    expect(admin.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last name' do
    admin = Admin.new(last_name: nil)
    admin.valid?
    expect(admin.errors[:last_name]).to include("can't be blank")
  end
end