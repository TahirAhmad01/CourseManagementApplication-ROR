class UserpanelController < ApplicationController
  def index
    @semesters = Semester.all
  end
end
