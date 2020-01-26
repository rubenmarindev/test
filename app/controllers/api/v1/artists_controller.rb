class Api::V1::ArtistsController < ApplicationController

  def albums_by_artist
    #@albums = Album.select(:id, :name, :image, :spotify_url, :total_tracks).where(artist_id:params[:id])
    @albums = Album.where(artist_id:params[:id])
  
  render json: @albums, root: 'data', each_serializer: AlbumSerializer, adapter: :json
  end

  def index
    my_artists = Array.new
    s_artists = Artist.all
    s_artists.map do |artist|
      artist.genres = Genre.where(artist_id:artist.id)
      my_artists.push(artist)
    end
    @artists = my_artists

  render json: @artists, root: 'data', each_serializer: ArtistSerializer, adapter: :json
  end

end
