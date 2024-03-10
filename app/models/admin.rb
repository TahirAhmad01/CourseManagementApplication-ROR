class Admin < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  has_one_attached :admin_profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true

end
