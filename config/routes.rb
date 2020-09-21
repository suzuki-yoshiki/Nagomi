Rails.application.routes.draw do

  root 'static_pages#top'

  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users do
    member do
      get 'edit_reservation_status'  #予約状況ページの件数を押すとモーダルに行く
      patch 'update_reservation_status'  #予約の編集
      get 'new_work_reservation'  #予約状況新規作成ページ行き
      get 'show_account'
    end
  end
  resources :staffs
  resources :phone_reservations
  resources :work_reservations
  resources :videos
  resources :works
  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
