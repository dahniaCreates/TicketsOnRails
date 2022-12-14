Rails.application.routes.draw do
  get 'about/index'
  get 'categories/index'
  get 'categories/show'
  get 'officers/index'
  get 'officers/show'
  get 'streets/index'
  get 'streets/show'
  get 'tickets/index'
  get 'tickets/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tickets, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :categories, only: [:index, :show]
  resources :officers, only: [:index, :show]
  resources :streets, only: [:index, :show]
  resources :about, only: [:index]
end
