class Artist 

	
	@@all = []

	attr_accessor :name, :songs

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		@songs << song
		song.artist = self unless song.artist == self
	end

	def songs
		@songs
	end

	def self.all 
		@@all
	end

	def save
		@@all << self
	end

	def self.find_or_create_by_name(singer)
		artist = {}
		if(@@all.detect{ |artist| artist.name == singer } != nil)
			
			artist = @@all.detect{ |artist| artist.name == singer }
			artist
		else	
			artist = Artist.new(singer)
			artist.save
		end
		artist	
	end

	def print_songs
		@songs.each do |song|
			puts song.name
		end
	end

end