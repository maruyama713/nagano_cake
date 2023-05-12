Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  root to: "public/homes#top"
  get '/about' => 'public/homes#about', as: 'about'

  scope module: :public do
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'
  end

  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/my_page' => 'customers#update'
    get 'customers/confirmation' => 'customers#confirmation'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  
  get 'orders/new' => 'public/orders#new'
  post 'orders/confirmation' => 'public/orders#confirmation'
  get 'orders/complete' => 'public/orders#complete'
  post 'orders/thanks' => 'public/orders#thanks'
  get 'orders' => 'public/orders#index'
  get 'orders/:id' => 'public/orders#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'

    resources :items, only: [:new, :index, :show, :edit, :update, :create]

    resources :customers, only: [:index, :show, :edit, :update]
    
    get 'orders/:id' => 'orders#show'
  end
end
