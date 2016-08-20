class TaskList < ApplicationRecord
  belongs_to :user
  has_many   :tasks, dependent: :destroy

  validates :name, :user, presence: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  def close!
    self.update_attribute(:done, true)
  end
end
