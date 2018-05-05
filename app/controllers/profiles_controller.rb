class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def show
  end

  def edit
    if @profile.nil?
      @profile = Profile.find_or_initialize_by(user: current_user)
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:warning] = 'New Profile Created'
      redirect_to profile_path
    else
      flash[:warning] = 'Profile Not Created'
      redirect_to back
    end

  end

  def update
    if @profile.update(profile_params)
      flash[:warning] = 'New Profile Created'
      redirect_to profile_path
    else
      flash[:warning] = 'Please enter the required fields'
      redirect_to back
    end
  end

  def destroy

  end

  private

  def set_profile
      @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit([
                                      :first_name,
                                      :last_name,
                                      :tagline,
                                      :bio,
                                      :avatar
                                    ])
  end
end