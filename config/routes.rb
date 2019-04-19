Rails.application.routes.draw do
  mount ActionCable.server => '/ws'

  get '/room/:video_id', to: "rooms#show"
  post '/room/:video_id', to: "rooms#post_message"
  post '/auth/google', to: "auth#login_with_google"
  get '/auth/me', to: "auth#me"
end
