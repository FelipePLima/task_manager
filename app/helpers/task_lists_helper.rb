module TaskListsHelper
  def finish_task_link(task_list)
    link_to "Fechar", close_task_list_path(task_list), method: :put unless task_list.done?
  end
end
