Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :posts
  end

  root 'topics#index'
end
