Dotdna::Application.routes.draw do

  resources :fitment_center_stocks


  match "/confirm_order" => "orders#confirm_order"

  resources :orders


  resources :products


  resources :customer_assets


  resources :customers


  devise_for :fitment_center_users

  resources :fitment_centers


  devise_for :admin_users

  root :to => 'dashboard#admin'


end
