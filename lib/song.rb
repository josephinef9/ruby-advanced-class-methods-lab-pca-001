class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new.save
  end

  def self.new_by_name(name)
    new_name = self.new #instantiate a new name
    new_name.name = name
    new_name #return it
  end

  def self.create_by_name(string_name)
    create_name = self.create
    create_name.name = string_name
    create_name
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song.is_a?(Song)
      song
    else
    create_by_name(song_name)
    end
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(".")[0].split(" - ")[1]
    artist_name = filename.split(" - ")[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end
end
