class BroadwayNow::Show
  attr_accessor :name, :theater, :running_time, :url, :story, :price#, :cast
  @@all = []

  def initialize(hash_attributes)
    hash_attributes.each {|key,value| self.send(("#{key}="), value)} 
  end

  def self.create_shows(shows_array)
    shows_array.each do |hash_attributes|
      show = self.new(hash_attributes)
      @@all << show
    end
  end

  def add_info(extra_info_hash) 
    extra_info_hash.each {|key,value| self.send(("#{key}="),value)}
  end

  def self.all
    @@all
  end

end


















