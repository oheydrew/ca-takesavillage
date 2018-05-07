class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    authorize @events
  end

  def show
  end

  def edit
    authorize @event
    @event = Event.find_or_initialize_by(id: params[:id])
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
                                    :location_details
                                  ])
  end
end
