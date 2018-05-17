class AddDueTimeToActionItems < ActiveRecord::Migration[5.1]
  def change
    add_column :action_items, :due_time, :time
  end
end
