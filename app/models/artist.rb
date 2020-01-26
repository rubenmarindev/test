class Artist < ApplicationRecord
    has_many :albums
    has_many :genres
    def self.new_from_spotify_artist(spotify_artist)
        Artist.new(
          name: spotify_artist.name,
          image: spotify_artist.images[0]["url"],
          popularity: spotify_artist.popularity,
          spotify_url: spotify_artist.uri,
          spotify_id: spotify_artist.id
        )
    end
end
