Rails.application.routes.draw do
  get "phlexboard/index"

  namespace :phlex do
    resources :tasks
    resources :posts
  end

  resources :tasks
  resources :posts

  root "dashboard#index"
end
