class StaticController < ApplicationController
  before_action :check_profile
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
    authorize @events
  end

  def contact

  end

  def contact_email
    user_info = { 
                  user: current_user, 
                  message: email_params[:message]
                }

    if ContactMailer.contact_email(user_info).deliver_now
      flash[:notice] = "Contact email sent successfully"
      redirect_to contact_path
    else
      flash[:warning] = "There was a problem sending your contact message."
      render :contact
    end
  end

  def donate
  end

  private

  def email_params
    params.require(:contact).permit([
                                    :message
                                    ])
  end
end