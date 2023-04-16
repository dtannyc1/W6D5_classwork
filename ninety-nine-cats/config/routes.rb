Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cats#index"

  resources :cats, only: [:index, :create, :update, :show, :new, :edit]
  resources :cat_rental_requests, only: [:new, :create]
  resources :cats do 
    resources :cat_rental_requests, only: [:new]
  end

end
