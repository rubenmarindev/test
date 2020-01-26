class Genre < ApplicationRecord
    belongs_to :artist
    def self.new_from_artist(artist_id, genre_name)
        Genre.new(
          name: genre_name,
          artist_id: artist_id
        )
    end
end
