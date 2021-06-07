Rails.application.routes.draw do
  devise_for :accounts
  root to: 'public#index'

  get 'account/:nickname', to: 'accounts#show', as: 'profile'
  get 'browse', to: 'browse#index'
  post 'unfollow/:id', to: 'accounts#unfollow', as: 'unfollow'
  post 'follow/:id', to: 'accounts#follow', as: 'follow'
end
