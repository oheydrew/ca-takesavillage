module ApplicationHelper
  def dollars(cents)
    "$#{'%.2f' % (cents.to_i/100.0)}"
  end
end
