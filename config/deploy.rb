require "bundler/capistrano"

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}


load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"
load "config/recipes/nodejs"
#load "config/recipes/rbenv"
load "config/recipes/check"

server "www.dotdna.co.za", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "dotdna"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :shared_children, shared_children + %w{public/uploads}
set :whenever_command, "bundle exec whenever"

set :scm, "git"
set :repository, "git@github.com:DigitalTsotsi/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy:create_symlink", "deploy:migrate"
