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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|obj| obj.name == name}
  end

  def self.find_or_create_by_name(name)
        self.create_by_name(name)
        self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(file_name)
    file_song = file_name.split(/[\.\-]/)
    file_song.each {|sentence| sentence.strip!}
    file_song.delete("mp3")
    song = self.new
    song.name = file_song[1]
    song.artist_name = file_song[0]
    song
  end

  def self.create_from_filename(file_name)
    file_song = file_name.split(/[\.\-]/)
    file_song.each {|sentence| sentence.strip!}
    file_song.delete("mp3")
    song = self.new
    song.name = file_song[1]
    song.artist_name = file_song[0]
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
