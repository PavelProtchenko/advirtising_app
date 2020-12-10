Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :promotion_videos, only: [:create, :destroy] do
        collection do
          get :timeline
        end
      end
      resources :fillers, only: [:create, :destroy]
    end
  end
end
