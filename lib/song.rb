require 'pry'

class Song
  attr_accessor :name, :artist_name, :song_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
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
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    raw_data = filename.split(/[\s+]-\s|(.mp3)/)
    song_name = raw_data[1].strip
    artist_name = raw_data[0].strip

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    raw_data = filename.split(/[\s+]-\s|(.mp3)/)
    song_name = raw_data[1].strip
    artist_name = raw_data[0].strip

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
