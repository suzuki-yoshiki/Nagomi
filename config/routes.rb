Rails.application.routes.draw do
  get 'work_histories/index'
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
      get 'new_work_reservation'  #予約状況新規作成ページ行き名前選択
      get 'new_index_work_reservation' #作業新規予約作成
      get 'show_account'
      get 'reservation_confirmed' #メール内容確認ページ行き
      patch 'reservation_confirmed_mail' #メール送信処理
      get 'quote_page' # 作業予約から見積もりページへ移動
    end
  end
  resources :staffs do
    member do
      get 'show_account'
    end
  end
  
  resources :phone_reservations do
    collection do
      get 'index_holidays'
      patch 'update_holidays'
      get 'index_users'
      patch 'update_index_users'
      get 'old_index_users'
    end
  end

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
  resources :cart_items
  resources :items do
      post '/add_item' => 'carts#add_item'
      post '/update_item' => 'carts#update_item'
      delete '/delete_item' => 'carts#delete_item'
  end

  resources :work_histories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
