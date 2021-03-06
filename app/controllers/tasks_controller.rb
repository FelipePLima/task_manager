class TasksController < ApplicationController
  before_action :authenticate_user!

  def close
    @task = current_user.tasks.find(params[:id])
    @task.check_and_close_tasks!
    redirect_to task_list_path(@task.task_list)
  end
end
