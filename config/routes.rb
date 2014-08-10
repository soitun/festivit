Rails.application.routes.draw do
  resources :submissions

  resources :tickets do
    collection { post :import }
  end

  root 'welcome#index'

  devise_for :users

  resources :admins, controller: 'users', only: [:new, :create], type: 'Admin'
  resources :volunteers, controller: 'users', only: [:new, :create], type: 'Volunteer'

  resources :participants do
    collection { post :import }
  end

  post 'approve', to: 'submissions#approve'
end
