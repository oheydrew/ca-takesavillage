class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :attend, :unattend]
  before_action :check_profile
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @events = Event.all
    authorize @events
  end

  def show
  end

  def edit
    authorize @event
    @event = Event.find_or_initialize_by(id: params[:id])
    @event.duration = (@event.duration / 60) / 60
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user

    if @event.save
      flash[:notice] = 'New workshop created!'
      redirect_to event_path(@event)
    else
      display_errors(@event)
      flash[:warning] = 'Oops! We found some problems...'
      render :new
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      flash[:notice] = 'Workshop updated'
      redirect_to event_path(@event)
    else
      display_errors(@event)
      flash[:warning] = 'Oops! We found some problems...'
      render :edit
    end
  end

  def destroy
    authorize @event
    @event.destroy
    flash[:notice] = 'Workshop deleted'
  end

  def attend
    authorize @event

    if @event.users_attending.include? current_user
      flash[:warning] = "You're already on the list!"
    elsif @event.users_attending.count < @event.max_attendees
      @event.users_attending << current_user
      flash[:notice] = "Great news! You're on the list!"
    else
      flash[:warning] = 'Sorry, this event has no more vacancies.'
    end
    redirect_back fallback_location: event_path
  end

  def unattend
    authorize @event

    @event.users_attending.destroy(current_user)
    flash[:warning] = "You're off the list"
    redirect_back fallback_location: event_path
  end

  private

  def display_errors(record)
    if record.errors.any? # If there are errors, do something
      flash[:warning] = record.errors.full_messages.join(' | ')
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit([ :title,
                                    :description,
                                    :requirements,
                                    :image,
                                    :price,
                                    :start_date,
                                    :avatar,
                                    :start_time,
                                    :duration,
                                    :street,
                                    :suburb,
                                    :state,
                                    :country_code,
                                    :location_details,
                                    :max_attendees
                                  ])
  end
end
