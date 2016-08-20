class User < ApplicationRecord
  has_many :task_lists, dependent: :destroy
  has_many :tasks, through: :task_lists

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
