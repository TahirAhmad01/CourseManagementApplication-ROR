class UserpanelController < ApplicationController
  def index
    @semesters = Semester.all
    @courses  = Course.where(semester_id:current_user.semester_id)
  end
end
