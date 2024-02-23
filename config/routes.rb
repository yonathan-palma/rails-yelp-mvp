Rails.application.routes.draw do
  get 'reviews/index'
  get 'restaurants/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # root "restaurants#index"
  # get 'restaurants' => 'restaurants#index'
  # get 'restaurants/new' => 'restaurants#new'
  # post 'restaurants' => 'restaurants#show'
  # resources :restaurants do
  #   collection do
  #     get :top
  #   end
  # end

  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
end
