Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  get "about" =>"public/homes#about"

  get "items" => "public/items#index"
  get "items/:id" => "public/items#show"




  get "customers/my_page" => "public/customers#show"

  scope module: :public do
    resource :customers,only: [:edit,:update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
  end

  get "cart_items" => "public/cart_items#index"
  patch "cart_items/:id" => "public/cart_items#update"
  delete "cart_items/:id" => "public/cart_items#destroy"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"
  post "cart_items" => "public/cart_items#create"

  get "orders/new" => "public/orders#new"
  post "orders/confirm" => "public/orders#confirm"
  get "orders/complete" => "public/orders#complete"
  post "orders" => "public/orders#create"
  get "orders" => "public/orders#index"
  get "orders/:id" => "public/orders#show"

  get "addresses/:id/edit" => "public/addresses#edit"
  get "addresses" => "public/addresses#index"
  post "addresses" => "public/addresses#create"
  patch "addresses/:id" => "public/addresses#update"
  delete "addresses/:id" => "public/addresses#destroy"


  namespace :admin do
    get "admin" => "admin/homes#top"
    resources :items,except: [:destroy]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:show,:update]do
      resources :orders_details,only: [:update]
  end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
