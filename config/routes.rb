Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#index'
  resources :dashboards, only: %i[index new create] do
    collection do
      patch :sort
    end
  end
end
