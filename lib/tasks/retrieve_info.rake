task :retrieve => :environment do
    #puts 'Load Begins...'
    #Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
    file_name = "#{Rails.root}/public/artists_list.yml"
    File.open(file_name, 'r') do |f|
        while name = f.gets
            spotify_artists = RSpotify::Artist.search(name, limit:1)
            spotify_artists.map do |spotify_artist|
                #Artist.transaction do
                    artist = Artist.new_from_spotify_artist(spotify_artist)
                    puts "Id: " + artist.spotify_id + "\tName: " + artist.name
                    my_artists = Artist.where(spotify_id:artist.spotify_id)
                    if (my_artists.length <= 0) then
                        artist.save
                        spotify_artist.genres.each do |s_genre|
                            genre = Genre.new_from_artist(artist.id, s_genre)
                            genre.save
                        end
                    end
                    list_aux = spotify_artist.albums.uniq { |alb| [alb.name.downcase] }
                    list_aux.map do |s_album|
                        #Album.transaction do
                            album = Album.new_from_spotify_album(s_album, artist.id)
                            my_albums = Album.where(spotify_id:album.spotify_id)
                            if (my_albums.length <= 0) then
                                album.save
                            end
                            s_album.tracks.map do |s_track|
                                song = Song.new_from_spotify_track(s_track, album.id)
                                my_songs = Song.where(spotify_id:song.spotify_id)
                                if (my_songs.length <= 0) then
                                    song.save
                                end
                            end
                        #end
                    end
                #end
            end
        end
    end
end