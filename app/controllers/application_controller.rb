class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # before_action :check_profile <- Moved to individual controllers so as to 
  # free up devise users controller 

  def after_sign_in_path_for(user)
    if user.profile.nil?
      new_profile_path 
    else
      root_path
    end
  end

  def check_profile
    if user_signed_in?
      redirect_to new_profile_path if current_user.profile.nil?
    end
  end

end
