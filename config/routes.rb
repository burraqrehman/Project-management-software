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
    resources :users do
      member do 
        get :activate
        get :deactivate
      end
    end
  end


  root "manager/clients#index"

end
