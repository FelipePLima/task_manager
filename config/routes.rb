Rails.application.routes.draw do
  root "task_lists#index"

  devise_for :users

  resources :task_lists, expect: [:destroy] do
    member do
      put  :close
      post :subscribing
      post :unsubscribing
    end
    collection do
      get :favorites
    end
  end

  put "tasks/:id/close", to: "tasks#close", as: 'close_task'
end
