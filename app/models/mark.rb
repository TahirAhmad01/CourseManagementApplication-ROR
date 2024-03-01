class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :semester
  belongs_to :course

  validates :marks, presence: true
end
