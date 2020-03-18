Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  devise_for :users

  resources :users, only: [:index, :show]

  root to: "welcome#index"
end
