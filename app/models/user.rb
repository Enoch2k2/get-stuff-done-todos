class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :action_items

  def completed_this_week
    action_items.select{|ai| ai.completed && ai.between_sunday_and_saturday(ai.due_at)}
  end

  def incompleted_this_week
    action_items.select{|ai| !ai.completed && ai.between_sunday_and_saturday(ai.due_at)}
  end

  def completed_this_month
    action_items.select{|ai| ai.completed && ai.due_at.month == Date.today.month && ai.due_at.year == Date.today.year}
  end

  def incompleted_this_month
    action_items.select{|ai| !ai.completed && ai.due_at.month == Date.today.month && ai.due_at.year == Date.today.year}
  end

  def completed
    action_items.select{|ai| ai.completed}
  end

  def incompleted
    action_items.select{|ai| !ai.completed}
  end
end
