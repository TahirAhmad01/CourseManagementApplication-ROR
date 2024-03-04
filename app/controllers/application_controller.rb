# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  helper_method :calculate_grade

  def calculate_grade(score)
    case score
    when 80..100
      'A+'
    when 75..79
      'A'
    when 70..74
      'A-'
    when 65..69
      'B+'
    when 60..64
      'B'
    when 55..59
      'B-'
    when 50..54
      'C+'
    when 45..49
      'C'
    when 40..44
      'D'
    else
      'F'
    end
  end

end
