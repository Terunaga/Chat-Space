Rails.application.routes.draw do
  devise_for :users, only: [:registrations, :sessions]
  root 'groups#index'
  resources :groups, except: [:destroy, :show]
  scope module: :groups do
    resources :groups, only: :none do
      resources :messages, only: [:index, :create]
    end
  end
  resources :users, only: :none do
    collection { get :search }
  end
end
