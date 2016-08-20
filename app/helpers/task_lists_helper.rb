module TaskListsHelper
  def finish_task_list_link(task_list)
    link_to "Fechar", close_task_list_path(task_list), method: :put unless task_list.done? || task_list.user != current_user
  end

  def finish_task_link(task)
    link_to "Fechar", close_task_path(task), method: :put unless task.done? || task.task_list.user != current_user
  end
end
