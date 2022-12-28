Rails.application.routes.draw do
  get 'test', to: 'test#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'trails#index'

  namespace :api do
    post 'notify_pr_opened', to: 'github#notify_pr_opened'
    post 'notify_pr_approved', to: 'github#notify_pr_approved'
    post 'notify_automated_tests_successful', to: 'github#notify_automated_tests_successful'
  end
end
