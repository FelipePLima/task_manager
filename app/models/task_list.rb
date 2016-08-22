class TaskList < ApplicationRecord
  belongs_to :user
  has_many   :tasks, dependent: :destroy, inverse_of: :task_list
  has_and_belongs_to_many :favorites_users, class_name: "User"

  validates :name, :user, presence: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  scope :public_lists, -> {where(is_public: true)}

  def check_and_close_tasks!
    close!
    tasks.update_all(done: true)
  end

  def close!
    update_attribute(:done, true) if open?
  end

  def open?
    !done
  end
end
