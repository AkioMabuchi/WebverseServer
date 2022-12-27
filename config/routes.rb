Rails.application.routes.draw do
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/uploadapp", to: "home#uploadapp"
  post "/uploadapp", to: "home#create_app"
  patch "/uploadapp", to: "home#update_app"
end
