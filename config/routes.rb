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

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/my_page' => 'public/customers#update'
  get 'customers/confirmation' => 'public/customers#confirmation'
  patch 'customers/withdrawal' => 'public/customers#withdrawal'

  get 'cart_items' => 'public/cart_items#index'
  patch 'cart_items/:id' => 'public/cart_items#update'
  delete 'cart_items/:id' => 'public/cart_items#destroy'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post 'cart_items' => 'public/cart_items#create'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/admin' => 'admin/homes#top'

    resources :items, only: [:new, :index, :show, :edit, :update, :create]

    resources :customers, only: [:index, :show, :edit, :update]
  end
end
