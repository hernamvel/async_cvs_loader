Rails.application.routes.draw do

  root to: "home#index"

  get 'home/index'
  post 'home/upload'

  mount ActionCable.server, at: '/cable'
end
