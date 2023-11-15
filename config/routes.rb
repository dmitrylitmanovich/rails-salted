Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

  resources :customers do
    resources :connections, shallow: true
  end
end
