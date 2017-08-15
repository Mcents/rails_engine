Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :invoices, only: [:index, :show]

      namespace :merchants do
      get '/find', to: 'find#show'
      get '/find_all', to: 'find#index'
      get '/random', to: 'random#show'
      end

     resources :merchants, only: [:index, :show]

    end
  end
end
