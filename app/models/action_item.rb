class ActionItem < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :due_at, presence: true
end
