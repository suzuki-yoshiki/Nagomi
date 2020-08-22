Rails.application.routes.draw do
  
  root 'static_pages#top'
  
  resources :users
  resources :staffs
  resources :phone_reservations
  resources :work_reservations
  resources :videos
  resources :works
  resources :tools
  devise_for :staffs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
