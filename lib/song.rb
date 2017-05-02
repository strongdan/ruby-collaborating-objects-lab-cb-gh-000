class Song

	attr_accessor :name, :artist

	def initialize(name)
	   	@name = name
	end


	def self.new_by_filename(file)
		new_song = file.split(" - ")

		song = Song.new(new_song[1])

		artist = Artist.find_or_create_by_name(new_song[0])

		song.artist = artist
		artist.add_song(song)

		song
	end

end
