require 'pry'
class MusicLibraryController

  def initialize(path='./db/mp3s')
    new_importer = MusicImporter.new(path).import
  end

  def call
    user_input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while user_input != 'exit' do
      user_input = gets.chomp
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    songs = Song.all.uniq
    songs.sort! {|a,b| a.name <=> b.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    songs
  end

  def list_artists
    artists = Artist.all.uniq
    artists.sort! {|a,b| a.name <=> b.name}
    artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
    artists
  end

  def list_genres
    genres = Genre.all.uniq
    genres.sort! {|a,b| a.name <=> b.name}
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
    genres
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_artist = gets.chomp
    artist_songs = []
    Song.all.uniq.each do |song|
      if song.artist.name == user_artist
        artist_songs << song
      end
    end

    artist_songs.sort! {|a,b| a.name <=> b.name}
    artist_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_genre = gets.chomp
    genre_songs = []
    Song.all.uniq.each do |song|
      if song.genre.name == user_genre
        genre_songs << song
      end
    end

    genre_songs.sort! {|a,b| a.name <=> b.name}
    genre_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_song = gets.chomp.to_i
    songs = Song.all.uniq
    songs.sort! {|a,b| a.name <=> b.name}
    if user_song >= 1 && user_song <= songs.length
      if songs[user_song - 1]  
        song_artist = songs[user_song - 1].artist.name
        song_name = songs[user_song - 1].name
        puts "Playing #{song_name} by #{song_artist}"
      end
    end  
  end

end


