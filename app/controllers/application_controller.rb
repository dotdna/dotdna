class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_admin_user!

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.to_s == "admin_user"
      "/"
    elsif resource_or_scope.to_s == "fitment_center_user"
      "/fitmentcenter"
    end
  end

end
