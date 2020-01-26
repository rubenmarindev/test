class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist_id
end
