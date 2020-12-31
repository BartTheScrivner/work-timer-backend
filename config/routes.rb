Rails.application.routes.draw do
  resources :task_sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :projects
        resources :tags
        resources :tasks
      end
    end
  end
  post "api/v1/login", to: "api/v1/auth#create"
  post "api/v1/signup", to: "api/v1/users#create"
end
