class PaymentsController < ApplicationController
  before_action :check_profile
  skip_before_action :authenticate_user!, only: [:index]

  def index
    redirect_to new_payment_path
  end

  def new
    @payment = Payment.new(user: current_user)
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    @payment.amount = @payment.amount.to_i * 100
    @payment.description = "One Time Donation"

    if @payment.save
      flash[:event] = 'Payment saved successfully'
      render :checkout
    else
      flash[:warning] = 'Payment not saved'
      render :new
    end
  end

  def checkout
  end

  def charge
    @payment = Payment.find(params[:payment_id])
    user = User.find(@payment.user_id)
    amount = @payment.amount
    description = @payment.description

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

    begin
      charge = Stripe::Charge.create(
        customer: customer,
        amount: amount,
        description: description,
        currency: 'aud'
      )

    rescue Stripe::CardError => e
      flash[:warning] = e.message
      redirect_to new_payment_path
    
    else
      @payment.charge = charge
      @payment.save
      flash[:notice] = 'Payment successful! Thankyou!'

    end
  end

  def reciept

  end


  # def checkout
  #   description = params[:payment_info][:description]
  #   amount = params[:payment_info][:amount]

  #   user = current_user
  #   @payment = Payment.new(user: user)

  #   if user.stripe_id.nil?
  #     customer = Stripe::Customer.create(
  #       email: params[:stripeEmail],
  #       source: params[:stripeToken]
  #     )
  #   else
  #     customer = Stripe::Customer.retrieve(user.stripe_id)
  #   end
  
  #   user.stripe_id = customer.id
  #   user.save

  #   charge = Stripe::Charge.create(
  #     customer: customer.id,
  #     amount: amount,
  #     description: description,
  #     currency: 'aud'
  #   )

  #   rescue Stripe::CardError => e
  #     flash[:warning] = e.message
  #     redirect_to donate_path

  #   @payment.charge_id = charge
  #   if @payment.
  #     flash[:notice] = 'New Profile Created'
  #     redirect_to profile_path(current_user)
  #   else
  #     display_errors(@profile)
  #     flash[:warning] = 'Please enter the required fields'
  #     redirect_back fallback_location: new_profile_path 
  #   end  

  # end

  # def checkout
  #   amount_cents = params[:amount].to_i * 100

  #   payment_info = {
  #                     amount: amount_cents,
  #                     description: params[:description]
  #                   }

  #   redirect_to new_payment_path({ payment_info: payment_info })
  # end

  private

  def payment_params
    params.require(:payment).permit([
                                      :amount,
                                      :description
                                    ])
  end
end