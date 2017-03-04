Rails.application.routes.draw do
  devise_for :users, only: [:registrations, :sessions]
  root 'groups#index'
  resources :groups, only: [:index, :new, :create, :edit, :update]
  scope module: :groups do
    resources :groups, only: :none do
      resources :messages, only: [:index]
    end
  end
end
