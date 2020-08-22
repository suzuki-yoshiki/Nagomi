Rails.application.routes.draw do
  # get 'tools/index'
  # get 'tools/new'
  # get 'tools/show'
  # get 'tools/edit'
  # get 'tools/update'
  # get 'tools/create'
  # get 'works/index'
  # get 'works/new'
  # get 'works/show'
  # get 'works/edit'
  # get 'works/update'
  # get 'works/create'
  # get 'videos/index'
  # get 'videos/new'
  # get 'videos/show'
  # get 'videos/edit'
  # get 'videos/update'
  # get 'videos/create'
  # get 'staffs/index'
  # get 'staffs/new'
  # get 'staffs/show'
  # get 'staffs/edit'
  # get 'staffs/update'
  # get 'staffs/create'
  # get 'work_reservations/index'
  # get 'work_reservations/new'
  # get 'work_reservations/show'
  # get 'work_reservations/edit'
  # get 'work_reservations/update'
  # get 'work_reservations/create'
  # get 'phone_reservations/index'
  # get 'phone_reservations/new'
  # get 'phone_reservations/show'
  # get 'phone_reservations/edit'
  # get 'phone_reservations/update'
  # get 'phone_reservations/create'
  root 'static_pages#top'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/new'
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
