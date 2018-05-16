class CreateActionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :action_items do |t|
      t.string :content
      t.boolean :completed, default: false
      t.date :completed_at
      t.date :due_at
      t.string :user_id

      t.timestamps
    end
    add_index :action_items, :user_id
  end
end
