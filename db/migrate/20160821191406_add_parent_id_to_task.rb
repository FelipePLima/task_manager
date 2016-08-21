class AddParentIdToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :parent_id, :integer, index: true
  end
end
