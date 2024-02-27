class User < ApplicationRecord
  belongs_to :semester
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable:recoverable,
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
end
