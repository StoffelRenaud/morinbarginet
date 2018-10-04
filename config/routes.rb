Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :reservations do
    resources :answers, only: [:create]
  end

  resources :topics do
    resources :posts, only: [:new, :create]
  end
end
