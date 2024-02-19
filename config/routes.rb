Rails.application.routes.draw do
  root 'home#index'


  authenticate :user do
    get 'userpanel/index'
  end

  authenticate :admin do
    get 'admin/index'
    resources :semesters
    resources :courses
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get "up" => "rails/health#show", as: :rails_health_check
end
