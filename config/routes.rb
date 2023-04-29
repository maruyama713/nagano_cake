Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  root to: "public/homes#top"
  get '/about' => 'public/homes#about', as: 'about'

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
  get '/admin' => 'admin/homes#top'
  
  resources :items, path: '/admin/items'
  
  resources :customers, only: [:index, :show, :edit, :update]

end
