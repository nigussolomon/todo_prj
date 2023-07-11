Rails.application.routes.draw do
  root "todos#index"
  resources :todos do
    member do
      get 'toggle', controller: :todos, action: :toggle_todo
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
