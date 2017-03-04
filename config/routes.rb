Rails.application.routes.draw do
  devise_for :users, only: [:registrations, :sessions]
  root 'chat_groups#index'
  resources :chat_groups, only: [:index] do
    collection { get 'index_message' }
  end
end
