Rails.application.routes.draw do
  namespace :phlex do
    get "dashboard/index"
    resources :tasks
    resources :posts
  end

  resources :tasks
  resources :posts

  root "dashboard#index"
end
