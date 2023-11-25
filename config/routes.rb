Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

  resources :customers do
    resources :connections, shallow: true do
      delete 'destroy'
      resources :accounts do
        resources :transactions
      end
    end
  end
  get 'connection_info/:connection_id', to: 'connection_info#index', as: :connection_info
end
