Rails.application.routes.draw do
  resources :shipping_labels, only: [:new, :create]
end
