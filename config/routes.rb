Rails.application.routes.draw do

  devise_for :users

  namespace :manager do
    resources :clients do 
      resources :projects do 
        resources :comments
      end
    end
  end 

  namespace :admin do
    resources :users
  end

  root "manager/clients#index"

end
