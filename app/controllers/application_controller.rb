class ApplicationController < ActionController::Base
  # pundit authorization
  include Pundit
  protect_from_forgery with: :exception
  # devise authentication
  before_action :authenticate_user!
end
