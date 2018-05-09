class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :check_profile, except: [:new, :create]

  def index
    authorize @profiles
    @profiles = Profile.all
  end

  def show
    events_owned = Event.where('owner_id = ?', params[:id])
    @events_current = events_owned.where('start_date >= ?', Date.today)
    @events_past = events_owned.where('start_date < ?', Date.today)

    # @events_current = Event.where('owner_id = ? AND start_date >= ?', params[:id], Date.today)
  end

  def edit
    authorize @profile
    if @profile.nil?
      @profile = Profile.find_or_initialize_by(user: current_user)
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:notice] = 'New Profile Created'
      redirect_to profile_path(current_user)
    else
      display_errors(@profile)
      flash[:warning] = 'Please enter the required fields'
      redirect_back fallback_location: new_profile_path
    end
  end

  def update
    authorize @profile
    if @profile.update(profile_params)
      flash[:notice] = 'Profile Updated'
    else
      display_errors(@profile)
      flash[:warning] = 'Please enter the required fields'
    end
  end

  def destroy
    authorize @profile
    @profile.destroy
    flash[:notice] = 'Profile Deleted'
  end

  private

  def display_errors(record)
    if record.errors.any? # If there are errors, do something
      flash[:warning] = record.errors.full_messages.join(' | ')
    end
  end

  def set_profile
    @profile = Profile.find_by(user_id: params[:id])
  end

  def profile_params
    params.require(:profile).permit([
                                      :first_name,
                                      :last_name,
                                      :tagline,
                                      :bio,
                                      :website,
                                      :email_show,
                                      :avatar
                                    ])
  end
end