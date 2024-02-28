Rails.application.routes.draw do

  # root 'home#index'

  authenticated :user do
    root 'userpanel#index', as: "users_dashboard"
    resources :enrolled_courses, only: [:create, :index, :show, :destroy,]
  end

  authenticated :admin do
    root 'admin#index', as: "admin_dashboard"
    resources :semesters
    resources :courses
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
