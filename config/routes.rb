Rails.application.routes.draw do
  resources :menus

  post "/signup" => "users#create"
  delete "/users" => "users#destroy"
end
