class ApplicationController < ActionController::Base
  protect_from_forgery
  :authenticate_user!
end
