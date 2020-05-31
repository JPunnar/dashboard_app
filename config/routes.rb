Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#index'
  resources :dashboards do
    collection do
      patch :sort
    end
  end
end
