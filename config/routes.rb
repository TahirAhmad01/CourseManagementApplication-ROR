Rails.application.routes.draw do
  authenticated :user do
    root 'userpanel#index', as: "users_dashboard"
    resources :enrolled_courses, only: [:create, :index, :show, :destroy,]
    get 'result', to: 'result#index'
  end

  authenticated :admin do
    root 'admin#index', as: "admin_dashboard"
    resources :semesters
    resources :courses
    resources :students_list
    # config/routes.rb
    get 'students_list/:id/mark', to: 'students_list#mark', as: 'mark_student'
    post 'students_list/:id/mark', to: 'enrolled_courses#create_marks', as: 'mark_students'

  end

  unauthenticated do
    root to: 'home#index'
  end

  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "up" => "rails/health#show", as: :rails_health_check
end
