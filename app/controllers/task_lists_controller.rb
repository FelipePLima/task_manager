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

  def favorites
    @favorites_task_lists = current_user.favorites_task_lists
    @public_task_lists = TaskList.public_lists - @favorites_task_lists
  end

  def subscribing
    current_user.add_favorite! params[:id]
    redirect_to favorites_task_lists_path
  end

  def unsubscribing
    current_user.remove_favorite! params[:id]
    redirect_to favorites_task_lists_path
  end

  private

  def task_list_params
    params.require(:task_list).permit(:name, :is_public, tasks_attributes: [:id, :description,
                                      :_destroy])
  end
end
