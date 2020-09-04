Rails.application.routes.draw do

  root 'static_pages#top'

  devise_for :staffs
  devise_for :users  #resourcesの下にdevise_forがあるとdeviseのルーティングが反映されなかったためresourcesよりも上に移動しました。
  resources :users
  resources :staffs
  resources :phone_reservations
  resources :work_reservations
  resources :videos
  resources :works
  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
