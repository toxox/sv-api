Rails.application.routes.draw do
  resources :rooms
  post '/auth', to: "auth#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
