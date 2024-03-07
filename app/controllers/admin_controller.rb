class AdminController < ApplicationController
  def index
    @total_student= User.all.count
    @total_semester= Semester.all.count
    @total_courses = Course.all.count
    @total_graduated_students = User.where.not(cgpa: nil).count
  end
end
