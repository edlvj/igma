require 'sidekiq/web'

mount Sidekiq::Web, at: '/sidekiq'

resources 'registrations', only: [:new, :create]
resources 'sessions', only: [:new, :create] do 
  collection do
    delete 'destroy'
  end
end

resources 'trackings', except: [:show, :edit, :update] do
  collection do
    post 'search',as: :search
  end
end

resources 'posts', only: [:index, :show]

root to: 'posts#index'
get '/trackings', to: 'trackings#search'
