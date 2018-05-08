require 'pry'

class PaymentsController < ApplicationController
  before_action :check_profile
  skip_before_action :authenticate_user!, only: [:index]

  def new

  end

  def create
    description = params[:payment_info][:description]
    amount = params[:payment_info][:amount]

    user = current_user
    @payment = Payment.new(user: user)

    if user.stripe_id.nil?
      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )
    else
      customer = Stripe::Customer.retrieve(user.stripe_id)
    end
  
    user.stripe_id = customer.id
    user.save

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: description,
      currency: 'aud'
    )

    rescue Stripe::CardError => e
      flash[:warning] = e.message
      redirect_to donate_path

    @payment.charge_id = charge
    if @payment.
      flash[:notice] = 'New Profile Created'
      redirect_to profile_path(current_user)
    else
      display_errors(@profile)
      flash[:warning] = 'Please enter the required fields'
      redirect_back fallback_location: new_profile_path 
    end  

  end

  def checkout
    amount_cents = params[:amount].to_i * 100

    payment_info = {
                      amount: amount_cents,
                      description: params[:description]
                    }

    redirect_to new_payment_path({ payment_info: payment_info })
  end

  private

  def payment_params
    params.require(:checkout).permit([
                                      :amount,
                                      :description,
                                      :payment_info
                                    ])
  end
end