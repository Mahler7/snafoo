Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :suggestions
    end
  end
  get '/signup' => 'employees#new'
  post 'employees' => 'employees#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
