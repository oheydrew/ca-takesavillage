module ApplicationHelper

  # drew's handy dandy error function: Loops through errors by field and displays them
  def display_errors(model, field)
    messages = []
    if model.errors[field].present?
      model.errors.full_messages_for(field).each do |message|
        messages << message
      end
      return "<br>#{messages.join('<br>')}".html_safe
    end
  end

  def dollars(cents)
    "$#{'%.2f' % (cents.to_i/100.0)}"
  end

  def static_map(address)
    image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{address}&zoom=14&scale=1&size=500x500&maptype=roadmap&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C#{address}", alt: 'Map Image'
  end

  def attendance_button(event)
    if policy(event).attend?
      if event.users_attending.include? current_user
        button_to 'Cancel my spot', unattend_event_path(event), method: :post, class: 'button btn-medium'
      else
        button_to 'Book my spot', attend_event_path(event), method: :post, class: 'button btn-medium'
      end
    else
      button_to 'Want in? Sign up!', new_user_registration_path, method: :get, class: 'button btn-medium'
    end
  end
end
