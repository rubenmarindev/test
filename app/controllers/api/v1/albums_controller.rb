class Api::V1::AlbumsController < ApplicationController
  def songs_by_album
   @songs = Song.where(album_id:params[:id])
  
  render json: @songs, root: 'data', each_serializer: SongSerializer, adapter: :json
  end

end
