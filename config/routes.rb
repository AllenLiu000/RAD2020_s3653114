Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/microposts' => 'microposts#show'
  get  '/select',    to: 'static_pages#select'
  post 'static_pages/selectTopic'
  resources :users
  resources :microposts
  resources :actives,          only: [:create]
  resources :comments
end