class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @task_lists = current_user.task_lists
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = current_user.task_lists.new(task_list_params)
    if @task_list.save
      redirect_to task_lists_path, notice: 'Lista de Tarefas criado com sucesso!'
    else
      render :new
    end
  end

  def close
    @task_list = current_user.task_lists.find(params[:id])
    @task_list.close!
    redirect_to task_lists_path
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  private

  def task_list_params
    params.require(:task_list).permit(:name, :is_public, tasks_attributes: [:id, :description,
                                      :_destroy])
  end
end
