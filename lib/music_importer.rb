class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    dir_files = Dir.glob(@path + "/*.mp3")
    files = []
    dir_files.each do |file|
      files << file.split("/").last
    end
    files
  end

end
