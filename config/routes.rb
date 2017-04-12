Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  post '/contest_entries', to: 'contest_entries#create'

  resources :prizes do
    resources :conditions, except: [:index]
  end
end
