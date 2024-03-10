class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :semesters

  def index
    @courses = if params[:semester_id].present?
                 Semester.find(params[:semester_id]).courses
               else
                 Course.all
               end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /courses/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: "Course was successfully created."  }
        format.turbo_stream { flash.now[:notice] = "Course was successfully created."  }
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: "Course was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Course was successfully updated."  }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name, :semester_id, :course_image, :credit, :description)
    end

  def semesters
    @semesters = Semester.all
    @semester = params[:semester_id] ? Semester.find(params[:semester_id]) : nil
  end
end
