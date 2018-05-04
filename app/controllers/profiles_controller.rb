class ProfilesController < ApplicationController
  def show

  end

  def edit
    @profile = Profile.find_or_initialize_by(user: current_user)
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
    @profile = current_user.profile

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