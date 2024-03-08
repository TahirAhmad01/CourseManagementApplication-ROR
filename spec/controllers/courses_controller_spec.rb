require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:semester) { Semester.create(semester_name: 'Fall 2024') } # Create a Semester instance before using it in Course creation
  let(:valid_attributes) {
    { course_name: 'Mathematics', credit: 3, semester_id: semester.id }
  }

  let(:invalid_attributes) {
    { course_name: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Course" do
        expect {
          post :create, params: { course: valid_attributes }, session: valid_session
        }.to change(Course, :count).by(1)
      end

      it "redirects to the created course" do
        post :create, params: { course: valid_attributes }, session: valid_session
        expect(response).to redirect_to(courses_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Course" do
        expect {
          post :create, params: { course: invalid_attributes }, session: valid_session
        }.to change(Course, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { course: invalid_attributes }, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { course_name: 'Physics' }
    }

    context "with valid parameters" do
      it "updates the requested course" do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: new_attributes }, session: valid_session
        course.reload
        expect(course.course_name).to eq('Physics')
      end

      it "redirects to the course" do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: valid_attributes }, session: valid_session
        expect(response).to redirect_to(courses_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      course = Course.create! valid_attributes
      expect {
        delete :destroy, params: { id: course.to_param }, session: valid_session
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = Course.create! valid_attributes
      delete :destroy, params: { id: course.to_param }, session: valid_session
      expect(response).to redirect_to(courses_url)
    end
  end
end
