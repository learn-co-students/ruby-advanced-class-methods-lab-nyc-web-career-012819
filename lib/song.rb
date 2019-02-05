require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @song = Song.new
    @@all << @song
    @song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name_of_song)
    if @@all.include?(self.find_by_name(name_of_song))
      self.find_by_name(name_of_song)
    else
      self.create_by_name(name_of_song)
    end
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]
    @@all << song
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end #end of class
