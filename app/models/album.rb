class Album < ApplicationRecord
    belongs_to :artist
    has_many :songs
    def self.new_from_spotify_album(spotify_album, artist_id)
        Album.new(
          name: spotify_album.name,
          image: spotify_album.images.length <= 0 ? " ":spotify_album.images[0]["url"],
          spotify_url: spotify_album.uri,
          total_tracks: spotify_album.total_tracks,
          spotify_id: spotify_album.id,
          artist_id: artist_id
        )
    end
end
