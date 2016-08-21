class CreateTaskListsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists_users, id: false do |t|
      t.belongs_to :task_list, index: true
      t.belongs_to :user, index: true
    end
  end
end
