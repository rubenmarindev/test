class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :popularity, :spotify_url, :spotify_id
  has_many:genres
  class GenreSerializer < ActiveModel::Serializer
    attributes :name
  end
end
