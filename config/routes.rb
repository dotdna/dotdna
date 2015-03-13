Dotdna::Application.routes.draw do

  match "/fitmentcenter_stock" => "dashboard#fitmentcenter_stock"

  match "/fitmentcenter" => "fitment_center_dashboard#index"

  match "/guarantee_documents" => "fitment_center_dashboard#guarantee_documents"

  resources :insurance_brokers


  match "/insurer_dashboard" => "dashboard#insurer_dashboard"

  resources :fitment_center_stocks

  match "/confirm_order" => "orders#confirm_order"

  match "/order_dispatch/:id" => "dashboard#order_dispatch"

  match "/dashboard/fitment_center" => "dashboard#fitment_center"

  resources :orders


  resources :products


  resources :customer_assets


  resources :customers


  devise_for :fitment_center_users


  resources :fitment_center_users

  devise_for :admin_users

  resources :fitment_centers

  root :to => 'dashboard#admin'


end
