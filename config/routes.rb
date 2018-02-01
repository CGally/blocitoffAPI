Rails.application.routes.draw do
  get 'items/create'

  devise_for :users

  resources :users do
    resources :items, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  get 'welcome' => 'welcome#index'

  authenticated :user do
    root "users#index", as: :authenticated_root
  end

  namespace :api, defaults: { format: :json } do
    resources :users do
       resources :items, only: [:create, :update]
    end
    resources :items, only: [:update]
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
