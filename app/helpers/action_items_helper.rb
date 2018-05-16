module ActionItemsHelper
  def parse_date(date)
    date.strftime("%m/%d/%Y")
  end
end
