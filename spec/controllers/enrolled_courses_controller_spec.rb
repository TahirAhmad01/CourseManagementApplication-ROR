require 'rails_helper'

RSpec.describe EnrolledCoursesController, type: :controller do
  describe "POST #create" do
    let(:semester) { FactoryBot.create(:semester) }
    let(:user) { FactoryBot.create(:user) }
    let(:course) { FactoryBot.create(:course) }


    context "with valid parameters" do
      let(:enrolled_course_params) { { enrolled_course: { course_id: course.id, semester_id: semester.id, users_id: user.id } } }

      it "creates a new enrolled course" do
        expect {
          post :create, params: enrolled_course_params
        }.to change(EnrolledCourse, :count).by(1)
      end

      it "redirects to the user's dashboard" do
        post :create, params: enrolled_course_params
        expect(response).to redirect_to(users_dashboard_path)
      end
    end

    context "with invalid parameters" do
      let(:enrolled_course_params) { { enrolled_course: { course_id: nil } } }

      it "renders the new template if other errors occur" do
        post :create, params: enrolled_course_params
        expect(response).to render_template(:new)
      end
    end
  end
end
