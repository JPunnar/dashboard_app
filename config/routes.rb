Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#index'
  resources :dashboards, only: %i[index new create]
end
