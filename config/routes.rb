Dotdna::Application.routes.draw do

  resources :customer_feedbacks


  resources :customer_verifications


  match "/fitmentcenter_stock" => "dashboard#fitmentcenter_stock"

  match "/fitmentcenter" => "fitment_center_dashboard#index"

  match "/guarantee_documents" => "fitment_center_dashboard#guarantee_documents"

  resources :insurance_brokers

  match "/insurer_dashboard" => "dashboard#insurer_dashboard"

  match "/app/dashboard" => "app#dashboard"
  match "/app/verification" => "app#verification"
  match "/check_login" => "app#check_login"
  match "/app" => "app#login"
  match "/app/profile" => "app#profile"
  match "/app/redflag" => "app#red_flag"
  match "/app/crimealert" => "app#crime_alert"
  match "/app/validate" => "app#validate"
  match "/validation_check" => "app#validation_check"
  match "/app/logout" => "app#logout"
  match "/action_redflag" => "app#action_redflag"
  match "/app/contactus" => "app#contactus"

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
