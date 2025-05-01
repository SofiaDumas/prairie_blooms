Rails.application.routes.draw do
  devise_for :users
  resource :store, only: [ :edit, :update, :show ]
  resources :payments
  resources :product_prices
  resources :order_items
  resources :orders do
    post "checkout", on: :member
  end
  resources :products, only: [ :index, :show ]
  resources :categories

  get "/cart", to: "cart#show", as: "cart"
  post "/cart/add/:product_id", to: "cart#add_item", as: "add_to_cart"
  post "/cart/edit/:product_id", to: "cart#edit_quantity", as: "edit_cart_item"
  post "/cart/update_quantity/:product_id", to: "cart#update_quantity", as: "update_cart_quantity"
  delete "/cart/remove/:product_id", to: "cart#remove_item", as: "remove_from_cart"
  post "/cart/checkout", to: "cart#checkout", as: "checkout_cart"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  # get "/category/:id", to: "categorys#show", as: "category"


  root "store#index"

  namespace :admin do
    get "orders/index"
    get "orders/mark_as_shipped"
    get "/products/index"
    get "/products/new"
    get "/products/edit"
    get "/products/show"
    get "/dashboard", to: "dashboard#index"
    get "/edit_about", to: "pages#edit_about"
    patch "/update_about", to: "pages#update_about"
    get "/edit_contact", to: "pages#edit_contact"
    patch "/update_contact", to: "pages#update_contact"
    resources :orders, only: [ :index, :show, :update ] do
      patch :mark_as_shipped, on: :member
    end
  end

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
