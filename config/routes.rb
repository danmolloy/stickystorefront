Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :contest_entries, only: [:create, :show]

  resources :prizes do
    resources :conditions, except: [:index]
  end
end
