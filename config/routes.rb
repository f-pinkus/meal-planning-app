Rails.application.routes.draw do
  resources :menus

  resources :menus do
    post :generate, on: :collection
  end

  post "/signup" => "users#create"
  delete "/users" => "users#destroy"

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
