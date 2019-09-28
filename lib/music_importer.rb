require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob(@path + "/*.mp3")
    music_files = []
    files.each do |file|
      music_filess << file.split("/").last.strip
    end
    music_files
  end



end
