class PaymentsController < ApplicationController
  before_action :check_profile
  skip_before_action :authenticate_user!, only: [:index]

 

end