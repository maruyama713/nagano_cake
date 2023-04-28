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

  resources :items, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get '/admin' => 'admin/homes#top'
  resources :items

end
