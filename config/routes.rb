Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/new'
  resources :user
  devise_for :staffs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
