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
      get 'reservation_confirmed' #メール内容確認ページ行き
      patch 'reservation_confirmed_mail' #メール送信処理
    end
  end
  resources :staffs do
    member do
      get 'show_account'
    end
  end
  resources :phone_reservations
  resources :work_reservations
  resources :videos
  resources :works do
    collection do
      get 'user_index'
      get 'user_show_room'
      get 'user_show_kitchen'
      get 'user_show_water'
      get 'user_show_outside'
    end
  end
  resources :tools
  resources :reviews
  resources :maps
  resources :carts, only: [:show] 
  resources :items do
    member do
      post '/add_item' => 'carts#add_item'
      post '/update_item' => 'carts#update_item'
      delete '/delete_item' => 'carts#delete_item'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
