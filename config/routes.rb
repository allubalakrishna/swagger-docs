Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/api/v1/' do
    scope module: :v1, except: [:new, :edit] do
      resources :posts
    end
  end
end