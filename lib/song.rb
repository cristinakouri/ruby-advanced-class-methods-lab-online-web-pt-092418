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
    song_name = self.new 
    song_name.save
    song_name
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end 

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|item| item.name == name }
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical 
    @@all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(filename)
    array1 = filename.split(" - ")
    new_artist = array1[0]
    array2 = array1[1].split(".")
    new_name = array2[0]
    song = self.new 
    song.artist_name = new_artist
    song.name = new_name 
    song
  end 

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end 

  def self.destroy_all
    self.all.clear 
  end 
end
