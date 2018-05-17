module ActionItemsHelper
  def parse_date(date)
    date.strftime("%m/%d/%Y")
  end

  def parse_time(date)
    date.strftime("%I:%M %p")
  end
end
