# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :redirect_if_admin_signed_in, only: [:new, :edit]
  before_action :set_default_semester, only: [:new]
  before_action :configure_permitted_parameters_for_user
  before_action :semesters

  # GET /resource/sign_up
  # def new
  #   super
  #   @user.semester_id = Semester.first.id if Semester.any?
  #   @semesters = Semester.all
  # end

  # POST /resource
  def create
    if Semester.any?
      if params[:user][:semester_id] == Semester.first.id.to_s
        super
      else
        redirect_to new_user_registration_path, notice: "You can only select the first semester for registration."
      end
    else
      redirect_to root_path, notice: "There are no semesters available for registration."
    end
  end



  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  protected

  def configure_permitted_parameters_for_user
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate, :semester_id, :profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthdate, :semester_id, :profile_picture])
  end

  def semesters
    @semesters = Semester.all
  end

  def set_default_semester
    @semester_id = Semester.first.id if Semester.any?
  end

  def redirect_if_admin_signed_in
    redirect_to admin_dashboard_path if current_admin
  end
end
