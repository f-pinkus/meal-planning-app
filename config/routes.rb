Rails.application.routes.draw do
  resources :menus

  post "/signup" => "users#create"
  delete "/users" => "users#destroy"

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
