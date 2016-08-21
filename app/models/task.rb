class Task < ApplicationRecord
  belongs_to :task_list, inverse_of: :tasks, required: false
  belongs_to :task_parent, foreign_key: :parent_id, class_name: "Task", required: false, inverse_of: :task_children
  has_many   :task_children, foreign_key: :parent_id, class_name: "Task",
                              dependent: :destroy, inverse_of: :task_parent

  accepts_nested_attributes_for :task_children, reject_if: :all_blank, allow_destroy: true

  validates :description, presence: true

  def close!
    self.update_attribute(:done, true)
  end
end
