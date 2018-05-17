class CreateActionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :action_items do |t|
      t.string :content
      t.datetime :completed_at
      t.datetime :due_at
      t.string :user_id

      t.timestamps
    end
    add_index :action_items, :user_id
  end
end
