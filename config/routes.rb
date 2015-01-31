Dotdna::Application.routes.draw do

  devise_for :admin_users

  root :to => 'dashboard#index'


end
