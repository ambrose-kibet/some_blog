Rails.application.routes.draw do
  devise_for :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:show, :new,:create] do
    resources :comments, only:[:index,:show,:new,:create]
    end
  end
end
