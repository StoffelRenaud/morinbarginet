Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :owner do
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]

    resources :topics, only: [:new, :create, :edit, :update, :destroy]

    resources :posts, only: [:new, :create, :edit, :update, :destroy] do
      resources :photos, only: [:create, :destroy]
    end

  end

  resources :reservations, only: [:index, :show]

  resources :topics, only: [:index, :show]

  resources :posts, only: [:index, :show] do
    resources :photos, only: [:index, :show, :update]
  end

end
