Rails.application.routes.draw do
  devise_for :users
  root 'chat_groups#index'
  resources :chat_groups, only: [:index] do
    collection { get 'index_message' }
  end
  resources :users, only: [:edit, :update]
end
