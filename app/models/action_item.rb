class ActionItem < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :due_at, presence: true

  def grab_sunday_of_week(date)
    case date.strftime("%A")
      when "Sunday"
        due_at
      when "Monday"
        due_at.prev_day(1)
      when "Tuesday"
        due_at.prev_day(2)
      when "Wednesday"
        due_at.prev_day(3)
      when "Thursday"
        due_at.prev_day(4)
      when "Friday"
        due_at.prev_day(5)
      when "Saturday"
        due_at.prev_day(6)
    end
  end

  def grab_saturday_of_week(date)
    case date.strftime("%A")
      when "Sunday"
        due_at.next_day(6)
      when "Monday"
        due_at.next_day(5)
      when "Tuesday"
        due_at.next_day(4)
      when "Wednesday"
        due_at.next_day(3)
      when "Thursday"
        due_at.next_day(2)
      when "Friday"
        due_at.next_day(1)
      when "Saturday"
        due_at
    end
  end

  def between_sunday_and_saturday(date)
    date.between?(grab_sunday_of_week(date), grab_saturday_of_week(date))
  end
end
