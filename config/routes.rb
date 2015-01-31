Dotdna::Application.routes.draw do

  devise_for :fitment_center_users

  resources :fitment_centers


  devise_for :admin_users

  root :to => 'dashboard#admin'


end
