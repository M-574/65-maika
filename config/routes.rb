Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get    'restaurants/top'   => 'restaurants#top'
  resources :users, only: [:index, :show]
  resources :restaurants do
    resources :likes, only: [:index, :create, :destroy]
  end
  
  root 'restaurants#top'
  
end
