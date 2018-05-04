class ApplicationController < ActionController::Base
  # pundit authorization
  include Pundit
  protect_from_forgery with: :exception
  # devise authentication
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    profile_edit_path if user.profile.nil?
  end
end
