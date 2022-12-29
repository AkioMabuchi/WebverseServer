Rails.application.routes.draw do
  root "home#top"

  resources :users, except: [:new, :edit]
  resources :vrms

  get "/login", to: "users#login"
  get "/signup", to: "users#signup"
  get "/settings", to: "users#edit"
  patch "/settings", to: "users#update"
  post "/login", to: "home#new_session"

  post "/#{Rails.application.credentials[:webverse][:api_key]}/login", to: "home#external_new_session"
  post "/#{Rails.application.credentials[:webverse][:api_key]}/session", to: "home#external_fetch_session"
end
