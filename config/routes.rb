Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :consumers, only: [:index, :show] do
    resources :snacks, only: [:index]
  end

  resources :brands, only: [:index, :show] do
    resources :snacks, only: [:index]
  end

  resources :snacks, only: [:index, :show]
end
