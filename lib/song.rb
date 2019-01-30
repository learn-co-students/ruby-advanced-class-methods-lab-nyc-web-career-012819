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
    song = Song.new
    song.save
    song
    # binding.pry
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
    # binding.pry
  end

  def self.find_by_name(song_name)
    @@all.find do |song_list|
      song_list.name == song_name
    end
    # binding.pry
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    songs = []
    songs = @@all
    songs.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(song_filename)
    song = Song.create
    filename = song_filename.split("-")
    artist = filename[0].strip
    song_name = filename[1].split(".")[0].strip
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_filename)
    song = Song.create
    filename = song_filename.split("-")
    artist = filename[0].strip
    song_name = filename[1].split(".")[0].strip
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
