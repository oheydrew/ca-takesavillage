class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
    authorize @event
    @event = Event.find_or_initialize_by(owner: current_user)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      flash[:notice] = 'New Event Created'
      redirect_to event_path(current_user)
    else
      display_errors(@event)
      # flash[:warning] = 'Please enter the required fields'
      redirect_back fallback_location: new_event_path
    end
  end

  def update
    authorize @event
    if @event.update(event_params)
      flash[:notice] = 'Event Updated'
    else
      display_errors(@event)
      flash[:warning] = 'Please enter the required fields'
    end
  end

  def destroy
    authorize @event
    @event.destroy
    flash[:notice] = 'Event Deleted'
  end

  private

  def display_errors(record)
    if record.errors.any? # If there are errors, do something
      flash[:warning] = record.errors.full_messages.join(' | ')
    end
  end

  def set_event
    @event = Event.find_by(owner_id: params[:id])
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
                                    :country_code
                                  ])
  end
end

t.bigint ""
t.string ""
t.text ""
t.text ""
t.text ""
t.integer ""
t.date ""
t.time ""
t.integer ""
t.string ""
t.string ""
t.string ""
t.string ""