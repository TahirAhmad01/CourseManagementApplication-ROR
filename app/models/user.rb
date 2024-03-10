class User < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  belongs_to :semester
  has_many :enrolled_courses, foreign_key: 'users_id'
  has_one_attached :profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable:recoverable,
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true
end
