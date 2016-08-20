class CreateTaskLists < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists do |t|
      t.string :name
      t.boolean :is_public, default: false
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
