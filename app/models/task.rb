class Task < ApplicationRecord
  belongs_to :task_list, inverse_of: :tasks, required: false
  belongs_to :task_parent, foreign_key: :parent_id, class_name: "Task", required: false, inverse_of: :task_children
  has_many   :task_children, foreign_key: :parent_id, class_name: "Task",
                              dependent: :destroy, inverse_of: :task_parent

  accepts_nested_attributes_for :task_children, reject_if: :all_blank, allow_destroy: true

  validates :description, presence: true

  def check_and_close_tasks!
    close!
    task_children.update_all(done: true)

    if task_parent.present?
      if task_parent.task_children.where(done: false).empty?
        task_parent.close!
      end
    else
      if task_list.tasks.where(done: false, parent_id: nil).empty?
        task_list.close!
      end
    end
  end

  def close!
    update_attribute(:done, true) if open?
  end

  def open?
   !done
  end

  def owner
    task_list.user
  end

end
