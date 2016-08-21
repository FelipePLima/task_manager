class User < ApplicationRecord
  has_many :task_lists, dependent: :destroy
  has_many :tasks, through: :task_lists
  has_and_belongs_to_many :favorites_task_lists, class_name: "TaskList"

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  def add_favorite! task_list_id
    task_list = TaskList.find(task_list_id)
    if self.favorites_task_lists.exclude?(task_list)
      self.favorites_task_lists << task_list
    end
  end

  def remove_favorite! task_list_id
    task_list = TaskList.find(task_list_id)
    self.favorites_task_lists.delete(task_list)
  end
end
