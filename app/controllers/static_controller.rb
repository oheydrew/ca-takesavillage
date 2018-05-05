class StaticController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :check_profile

  def index
  end

  def contact
  end

  def contact_email

  end
end