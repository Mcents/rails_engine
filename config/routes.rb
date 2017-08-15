Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do


      namespace :merchants do
      get '/find', to: 'find#show'
      get '/find_all', to: 'find#index'
      get '/random', to: 'random#show'
      end

      namespace :invoices do
        get '/find', to: 'find#show'
      end

     resources :invoices, only: [:index, :show]
     resources :merchants, only: [:index, :show]

    end
  end
end
