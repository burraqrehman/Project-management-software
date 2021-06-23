Rails.application.routes.draw do
  
  devise_for :users

    resources :projects do 
      resources :comments
    end

    resources :users
  
  root "projects#index"
end
