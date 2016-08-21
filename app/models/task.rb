class Task < ApplicationRecord
  belongs_to :task_list
  belongs_to :task_parent, foreign_key: :parent_id, class_name: "Task", required: false
  has_many   :task_children, foreign_key: :parent_id, class_name: "Task"

  validates :description, presence: true

  def close!
    self.update_attribute(:done, true)
  end
end
