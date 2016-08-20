class User < ApplicationRecord
  has_many :task_lists, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
