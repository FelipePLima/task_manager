Rails.application.routes.draw do
  root "task_lists#index"

  devise_for :users

  resources :task_lists, expect: [:edit, :update, :destroy] do
    member do
      put :close
    end
  end
end
