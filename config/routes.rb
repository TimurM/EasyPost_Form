Rails.application.routes.draw do
  resources :easy_posts, only: [:new, :create]
end
