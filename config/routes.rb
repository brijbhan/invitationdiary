Rails.application.routes.draw do
  devise_for :users
  
  root to: 'invitees#index'

  resources :invitees
end
