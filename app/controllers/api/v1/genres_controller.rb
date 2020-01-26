class Api::V1::GenresController < ApplicationController
  def random_song_by_genre
    genres = Genre.where(name:params[:genre_name])
    genre = genres[rand(genres.length)]
    artist = Artist.find(genre.artist_id)
    albums = Album.where(artist_id:artist.id)
    album = albums[rand(albums.length)]
    songs = Song.where(album_id:album.id)
    @song = songs[rand(songs.length)]

  render json: @song, root: 'data', each_serializer: SongSerializer, adapter: :json
  end
end
