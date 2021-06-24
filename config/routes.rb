Rails.application.routes.draw do

  devise_for :users

  namespace :manager do
    resources :clients
    resources :projects do 
      resources :comments
    end
  end 

  namespace :admin do
    resources :users
  end

  root "admin/projects#index"

end
