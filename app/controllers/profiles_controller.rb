class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :check_profile, except: [:new, :create]

  def show
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
      flash[:warning] = 'Please enter the required fields'
      redirect_back fallback_location: new_profile_path
    end
  end

  def update
    authorize @profile
    if @profile.update(profile_params)
      flash[:notice] = 'Profile Successfully Updated'
      redirect_to profile_path(current_user)
    else
      flash[:warning] = 'Please enter the required fields'
    end
  end

  def destroy

  end

  private

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