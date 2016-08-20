Rails.application.routes.draw do
  root "task_lists#index"

  devise_for :users

  resources :task_lists, only: [:index, :new, :create]
end
