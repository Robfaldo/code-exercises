Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'trails#index'

  namespace :api do
    post 'notify_pr_opened', to: 'github#notify_pr_opened'
    post 'notify_pr_approved', to: 'github#notify_pr_approved'
  end
end
