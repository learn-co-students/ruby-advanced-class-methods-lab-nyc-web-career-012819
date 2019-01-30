require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	song = self.new
  	@@all << song
  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	@@all << song
  	song
  end

  def self.create_by_name(name)
  	song = self.create
  	song.name = name
  	song
  end

  def self.find_by_name(name)
  	self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name) == nil
  		self.create_by_name(name)
  	else
  		self.find_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
  	song = self.new_by_name(filename_info(filename)[:song_name])
  	song.artist_name = filename_info(filename)[:artist]
  	song
  end

  def self.create_from_filename(filename)
  	song = self.create_by_name(filename_info(filename)[:song_name])
  	song.artist_name = filename_info(filename)[:artist]
  	song
  end

  def self.destroy_all
  	@@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Start of private methods
  private

  # Helper method to clean up filename
  # Return hash with artist and song_name
  def self.filename_info(filename)
  	info = {
  		artist: filename.split(" - ")[0],
  		song_name: filename.split(" - ")[1][0...-4]
  	}
  end

end
