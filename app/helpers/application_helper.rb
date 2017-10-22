module ApplicationHelper

  def euro_format(date)
    date.strftime('%d %B %Y')
  end
end
