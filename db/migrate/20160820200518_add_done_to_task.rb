class AddDoneToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :task_lists, :done, :boolean, default: false
    add_column :tasks, :done, :boolean, default: false
  end
end
