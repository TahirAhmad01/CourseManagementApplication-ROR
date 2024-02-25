class UserpanelController < ApplicationController
  before_action :user_signed_in?
  def index
    @semesters = Semester.all
  end
end
