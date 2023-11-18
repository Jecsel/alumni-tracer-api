Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'application#home'

  get "ping", to:"application#ping"
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  resources :auth, only: [:index] do
    collection do
      post 'sign_in'
    end
  end

  resources :user, only: [:index] do
    collection do
      post 'update_user'
      post 'deactivate_user'
      post 'register'
    end
  end


  resources :alumni_main, only: [:index, :create, :show] do
    collection do
    end
  end

  resources :work, only: [:index, :create, :show] do
    collection do
    end
  end
  
end
