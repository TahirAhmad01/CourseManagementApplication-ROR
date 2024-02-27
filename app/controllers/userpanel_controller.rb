class UserpanelController < ApplicationController
  def index
    @semesters = Semester.all
    @courses  = Course.all
  end
end
