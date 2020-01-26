Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists do
        collection do
          get :index
          get '/:id/albums', to: 'artists#albums_by_artist'
        end
      end
      resources :albums do
        collection do
          get :index
          get '/:id/songs', to: 'albums#songs_by_album'
        end
      end
      resources :genres do
        collection do
          get '/:genre_name/random_song', to: 'genres#random_song_by_genre'
        end
      end
    end
  end
end
