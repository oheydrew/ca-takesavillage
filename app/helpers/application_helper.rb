module ApplicationHelper
  def dollars(cents)
    "$#{'%.2f' % (cents.to_i/100.0)}"
  end

  def static_map(address)
    image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{address}&zoom=14&scale=1&size=350x350&maptype=roadmap&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C#{address}", alt: 'Map Image'
  end
end
