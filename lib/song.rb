class Song
  attr_accessor :name, :artist_name
  @@all= []

   def save
     self.class.all << self
  end

  def self.all
    @@all
    end

  def self.create #constructor -it is an extension of initialize
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)#instantiates a song with name property
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(name)
      @@all.detect{|song| song.name == name}
    end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
  @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    data= file_name.split (" - ")
    name[1].slice!(".mp3")


    song = self.new
    song.name = name[1]
    song.artist_name = name[0]
    song
  end

  def self.create_from_filename

  end

   def self.destroy_all
    self.all.clear
  end
end
