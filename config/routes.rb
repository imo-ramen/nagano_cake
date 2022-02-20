Rails.application.routes.draw do

  root to: "public/homes#top"
  get "about" =>"public/homes#about"



  get "customers/my_page" => "public/customers#show"

  scope module: :public do

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete :destroy_all
    end
  end

    resources :orders, only: [:new, :create, :index, :show] do
    collection do
      post :confirm
      get :complete
    end
  end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resource :customers,only: [:edit,:update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :items,except: [:destroy]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:show,:update]do
    resources :orders_details,only: [:update]
  end
  end

  devise_for :admins,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
