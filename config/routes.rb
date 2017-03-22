Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journey, only: [:index, :show] do
    resources :poi, only: [:index, :show]
  end
  namespace :artist do
    resources :journey do
      resources :poi
    end
  end
  get 'styleguide', to: 'pages#styleguide'
  get 'testgmap', to: 'pages#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
