class ApplicationController < ActionController::Base
  # pundit authorization
  include Pundit
  protect_from_forgery with: :exception
  # devise authentication
  before_action :authenticate_user!

  # def after_sign_in_path_for(user)
  #   if user.profile.nil?
  #     profile_edit_path
  #   end
  # end

  def after_sign_up_path_for(user)
    profile_edit_path
  end

end
