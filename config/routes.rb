Rails.application.routes.draw do
  get "clips/index"
  get "clips/my_clips"
  get "clips/new"
  get "clips/create"
  devise_for :users
  root to: "clips#index"
  resources :clips, only: [ :new, :create, :index, :edit, :update, :destroy ]
  get "my_clips", to: "clips#my_clips"

  resources :clips do
    post "like", on: :member
    post "unlike", on: :member
  end







  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
end
