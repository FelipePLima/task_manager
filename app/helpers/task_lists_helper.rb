module TaskListsHelper
  def finish_task_list_link(task_list)
    link_to fa_icon("times"), close_task_list_path(task_list), method: :put, class: :red if task_list.open? && task_list.user == current_user
  end

  def finish_task_link(task)
    owner = task.task_parent.present? ? task.task_parent.owner : task.owner
    link_to fa_icon("times"), close_task_path(task), method: :put, class: :red if task.open? && owner == current_user
  end
end
