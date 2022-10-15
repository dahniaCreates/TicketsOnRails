Rails.application.routes.draw do
  get 'officers/index'
  get 'officers/show'
  get 'streets/index'
  get 'streets/show'
  get 'tickets/index'
  get 'tickets/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
