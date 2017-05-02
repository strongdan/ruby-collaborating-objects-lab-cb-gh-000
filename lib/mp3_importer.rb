class MP3Importer

  attr_reader :path, :files

  def initialize(path)
    @path = path
    files
    import
  end

  def files
    @files = Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    @files.each {|file| Song.new_by_filename(file)}
  end

end
