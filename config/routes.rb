Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  namespace :api do
    namespace :v1 do
      resources :projects, only: [:create]
      get '/get_routes', to: 'routes#get_routes'
      get '/get_ticks', to: 'users#get_ticks'
      get '/get_to_dos', to: 'users#get_to_dos'
    end
  end




end
