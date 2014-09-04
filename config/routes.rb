Rails.application.routes.draw do
  devise_for :users

  resources :hangmen, only: [:index, :show, :create, :update]

  root to: "static_pages#home"
end
