Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users, controllers: { masquerades: "masquerades" }

    resources :users, only: [:index, :show, :update] do
      resources :collections, except: [:index, :new, :edit]
      resource :ban, only: [:update, :destroy]
      resource :privileges, only: [:update]
    end
  end

  get '/:locale' => 'welcome#index'
  root to: "welcome#index"
end
