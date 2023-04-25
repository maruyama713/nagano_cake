Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  resources :items, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  resources :items
  end
end
