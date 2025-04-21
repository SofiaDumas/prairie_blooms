Rails.application.routes.draw do
  get "cart/show"
  get "cart/add_item"
  get "cart/remove_item"
  get "cart/checkout"
  get "cart", to: "cart#show", as: "cart"
  post "/cart/add/:product_id", to: "cart#add_item", as: "add_to_cart"
  delete "cart/remove/:product_id", to: "cart#remove_item", as: "remove_from_cart"
  post "cart/checkout", to: "cart#checkout", as: "checkout"


  resources :stores
  resources :payments
  resources :product_prices
  resources :order_items
  resources :orders
  resources :products
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
