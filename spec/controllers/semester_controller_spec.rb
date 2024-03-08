require 'rails_helper'

RSpec.describe SemestersController, type: :controller do
  let(:valid_attributes) { { semester_name: 'Spring 2024' } }
  let(:invalid_attributes) { { semester_name: nil } }

  describe "GET #index" do
    it "returns a success response" do
      semester = Semester.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      semester = Semester.create! valid_attributes
      get :show, params: { id: semester.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      semester = Semester.create! valid_attributes
      get :edit, params: { id: semester.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Semester" do
        expect {
          post :create, params: { semester: valid_attributes }
        }.to change(Semester, :count).by(1)
      end

      it "redirects to the semesters list" do
        post :create, params: { semester: valid_attributes }
        expect(response).to redirect_to(semesters_path)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) { { semester_name: 'Fall 2024' } }

    context "with valid parameters" do
      it "updates the requested semester" do
        semester = Semester.create! valid_attributes
        put :update, params: { id: semester.to_param, semester: new_attributes }
        semester.reload
        expect(semester.semester_name).to eq('Fall 2024')
      end

      it "redirects to the semester" do
        semester = Semester.create! valid_attributes
        put :update, params: { id: semester.to_param, semester: valid_attributes }
        expect(response).to redirect_to(semester)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested semester" do
      semester = Semester.create! valid_attributes
      expect {
        delete :destroy, params: { id: semester.to_param }
      }.to change(Semester, :count).by(-1)
    end

    it "redirects to the semesters list" do
      semester = Semester.create! valid_attributes
      delete :destroy, params: { id: semester.to_param }
      expect(response).to redirect_to(semesters_url)
    end
  end

end
