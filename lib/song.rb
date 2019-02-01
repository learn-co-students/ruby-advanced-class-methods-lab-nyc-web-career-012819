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
    new_song = Song.new
    @@all << new_song
    @@all[-1]
  end

def self.new_by_name(name)
  new_song = Song.new
  new_song.name = name
  new_song
end

def self.create_by_name(name)
new_song = Song.new
new_song.name = name
@@all << new_song
@@all[-1]
end

def self.find_by_name(name)
  @@all.find do |song|
    if song.name == name
      name
    end
  end
end


def self.find_or_create_by_name(name)
  self.create_by_name(name)
  self.find_by_name(name)
end

def self.alphabetical
  @@all.sort_by do |song|
      song.name
  end
end


def self.new_from_filename(file)
  song = self.new
  song.name = file.split(" - ")[1].split(".")[0]
  song.artist_name = file.split(" - ")[0]
  song
end

def self.create_from_filename(file)
  song = self.new
  song.name = file.split(" - ")[1].split(".")[0]
  song.artist_name = file.split(" - ")[0]
  @@all << song
  song
end

def self.destroy_all
  @@all.clear
end




end
