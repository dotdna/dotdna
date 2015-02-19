Dotdna::Application.routes.draw do

  resources :fitment_center_stocks

  match "/confirm_order" => "orders#confirm_order"

  match "/order_dispatch/:id" => "dashboard#order_dispatch"

  match "/dashboard/fitment_center" => "dashboard#fitment_center"

  resources :orders


  resources :products


  resources :customer_assets


  resources :customers

  resources :fitment_center_users

  devise_for :fitment_center_users

  match "/fitmentcenter" => "fitment_center_dashboard#index"

  resources :fitment_centers


  devise_for :admin_users

  root :to => 'dashboard#admin'


end
