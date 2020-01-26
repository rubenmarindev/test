class Song < ApplicationRecord
    belongs_to :album
    def self.new_from_spotify_track(spotify_track, album_id)
        Song.new(
          name: spotify_track.name,
          spotify_url: spotify_track.uri,
          preview_url: spotify_track.preview_url,
          duration_ms: spotify_track.duration_ms,
          explicit: spotify_track.explicit,
          spotify_id: spotify_track.id,
          album_id: album_id 
          #artist: spotify_track.artists[0].name,
          #image: spotify_track.album.images[0]["url"],
        )
    end
end
