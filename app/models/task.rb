class Task < ApplicationRecord
  belongs_to :task_list

  validates :description, presence: true

  def close!
    self.update_attribute(:done, true)
  end
end
