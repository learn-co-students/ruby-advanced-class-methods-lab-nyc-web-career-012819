class Song
  attr_accessor :name, :artist_name
  @@all = []

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

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name_s)
    if @@all.include?(self.find_by_name(name_s))
      self.find_by_name(name_s)
    else
      self.create_by_name(name_s)
    end
  end

  def self.alphabetical
    @@all.sort_by{ |x| x.name }
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

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
