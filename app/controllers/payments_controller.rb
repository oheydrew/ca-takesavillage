class PagesController < ApplicationController
  before_action :check_profile
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
    authorize @events
  end

  def contact  
  end

  def donate
  end

end