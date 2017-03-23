Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: [:index, :show] do
    resources :pois, only: [:index, :show]
  end
  namespace :artists do
    resources :journeys do
      resources :pois
    end
  end
  get 'styleguide', to: 'pages#styleguide'
  get 'testgmap', to: 'pages#test'
  get 'template', to: 'pages#template'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
