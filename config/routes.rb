Rails.application.routes.draw do
  root 'chat_groups#index'
  resources :chat_groups, only: [:index] do
    collection { get 'index_message' }
  end
end
