Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'application#home'

  get "ping", to:"application#ping"
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get 'dashboard_count', to:"application#dashboard_count"

  resources :auth, only: [:index] do
    collection do
      post 'sign_in'
      post 'forgot_password'
    end
  end

  resources :user, only: [:index] do
    collection do
      post 'update_user'
      post 'deactivate_user'
      post 'register'
    end
  end

  resources :alumni_main, only: [:index, :create, :show, :destroy] do
    collection do
      post 'updateAlumni'
      post 'dashboard_count'
      post 'alumniGroupByBatch'
      post 'alumniPerBatch'
      post 'alumniGroupByWorkType'
      post 'alumniPerWorkType'
      post 'batchYearList'
      post 'registeredAlumniDataChart'
      post 'getItRelateData'
      post 'getIsGovSect'
      post 'joinAlumniWork'
      post 'updateAlumniImage'
    end
  end

  resources :work, only: [:index, :create, :show] do
    collection do
      post 'updateWork'
    end
  end

  resources :alumni_list, only: [:index, :create]

  resources :job_post, only: [:index, :create] do
    collection do
      post 'updateImage'
      post 'acceptJob'
      post 'rejectJob'
      post 'currentActiveJobs'
      post 'currentActiveApproveJobs'
      post 'userJobPosts'
      post 'updateJob'
    end
  end

  resources :event_post, only: [:index, :create] do
    collection do
      post 'updateImage'
      post 'acceptEvent'
      post 'rejectEvent'
      post 'getCurrentEvents'
      post 'getUpcomingEvents'
      post 'updateEvent'
    end
  end
  
end
