module TaskListsHelper
  def finish_task_list_link(task_list)
    link_to "Fechar", close_task_list_path(task_list), method: :put if task_list.open? && task_list.user == current_user
  end

  def finish_task_link(task)
    link_to "Fechar", close_task_path(task), method: :put if task.open? && task.owner == current_user
  end
end
