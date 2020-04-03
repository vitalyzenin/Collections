Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users, controllers: { masquerades: "masquerades", registrations: "users/registrations" }

    resources :users, only: [:index, :show, :update] do
      resource :ban, only: [:update, :destroy]
      resource :privileges, only: [:update]
    end
    resources :collections, except: [:index, :new, :edit] do
      resources :items, except: [:index, :show, :new, :edit]
    end
    resources :items, only: [:show]
  end

  get 'users/:user_id/collections/items/autocomplete_tag_name', to: 'items#autocomplete_tag_name', as: 'autocomplete'
  get '/results', to: 'search#search'
  get '/:locale' => 'welcome#index'
  root to: "welcome#index"
end
