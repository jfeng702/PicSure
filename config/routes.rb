Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create]
    resources :albums, only: [:create, :update, :index, :destroy, :show] do
      member do
        get 'album_photos'
        post 'create_album_photo'
      end
    end
    resource :session, only: [:create, :destroy]
    resources :photos do
      resources :comments, only: [:create, :index]
      resources :taggings, only: [:create, :show, :destroy, :index]
    end
    resources :comments, only: [:destroy]
    resources :tags, only: [:destroy, :show, :create, :index] do
      resources :photos, only: [:index]
    end
    resources :users do
      get 'user_photos', on: :collection
      get 'user_albums', on: :collection
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#root"
end
