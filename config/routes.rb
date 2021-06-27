Rails.application.routes.draw do
  devise_for :accounts

  root to: 'public#index'

  get 'account/:nickname', to: 'accounts#show', as: 'profile'
  get 'browse', to: 'browse#index'
  post 'room/:id', to: 'browse#room', as: 'convo'
  post 'unfollow/:id', to: 'accounts#unfollow', as: 'unfollow'
  post 'follow/:id', to: 'accounts#follow', as: 'follow'
  get 'good', to: 'browse#good', as: 'good'
  get 'bad', to: 'browse#bad'
  get 'read/:id', to: 'messages#read'
end
