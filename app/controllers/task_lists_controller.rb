class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @task_lists = current_user.task_lists
  end
end
