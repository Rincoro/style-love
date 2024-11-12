Rails.application.routes.draw do
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "pages#top"
get "login", to: "user_sessions#new"
post "login", to: "user_sessions#create"
delete "logout", to: "user_sessions#destroy"


post "oauth/callback" => "oauths#callback"
get "oauth/callback" => "oauths#callback"
get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
get "oauths/oauth", to: "oauths#oauth", as: :oauths_oauth
get "terms", to: "pages#terms"
get "privacy", to: "pages#privacy"

  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: %i[new create]
  resources :items

  resources :comments, only: %i[new create destroy edit update]
  resources :articles,  only: %i[index new create show edit update destroy search] do
    collection do
      get :bookmarks
    end
    resources :comments, only: %i[new create destroy edit update]
    resources :attachments, controller: "articles/attachments", only: %i[destroy]
  end

  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # Defines the root path route ("/")
  # root "posts#index"
end
