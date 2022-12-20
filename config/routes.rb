Rails.application.routes.draw do
  devise_for :users
  resources :students
  root 'smart_classes#index'
  resources :smart_classes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
