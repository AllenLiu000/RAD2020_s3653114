Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/microposts', to: 'microposts#show'
  get  '/select',    to: 'static_pages#select'
  post 'static_pages/selectTopic'
  get  '/password',    to: 'password_resets#edit'
  get  '/avatar',    to: 'avatars#edit'
  resources :users
  resources :microposts
  resources :actives,          only: [:create]
  resources :comments
  resources :verifications
end