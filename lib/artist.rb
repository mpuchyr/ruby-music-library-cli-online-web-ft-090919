require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end

    if song.artist == self && !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
