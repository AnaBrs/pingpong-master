Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history', as: 'history'
  get '/log',     to: 'home#log'
  post '/game/create',   to: 'game#create', as: 'games'
end
