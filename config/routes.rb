Rails.application.routes.draw do
  resources :rooms
  post '/auth/google', to: "auth#login_with_google"
  get '/auth/me', to: "auth#me"
end
