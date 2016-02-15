class BroadwayNow::Show
  attr_accessor :name, :theater, :running_time  #, :price, :url, :story, :cast

  def self.today
    #should return a list of all shows currently running.
    # technically a bunch of instances of Show.
=begin
    show_1 = self.new
    show_1.name = "Lion King"
    show_1.theater = "Minskoff Theatre"
    show_1.running_time = "2hrs, 30mins (1 Intermission)"
    show_1.price = "from $92"
    show_1.url = "http://www.broadway.com/shows/the-lion-king/"
    #show_1.story = "A lively stage adaptation of ..."
    #show_1.cast = ""

    show_2 = self.new
    show_2.name = "The Book of Mormon"
    show_2.theater = "Eugene O'Neill Theatre"
    show_2.running_time = "2hrs, 30mins (1 Intermission)"
    show_2.price = "from $99"
    show_2.url = "http://www.broadway.com/shows/book-mormon/"
    #show_2.story = ""
    #show_2.cast = ""

    [show_1, show_2]
=end
  self.scrape_shows
  end

  def self.scrape_shows
    shows = []

    (shows << self.scrape_first).flatten!
    #shows << self.scrape_second
    #shows << self.scrape_third
    #shows << self.scrape_fourth
    #shows << self.scrape_fifth
    shows
  end

  def self.scrape_first
    doc = Nokogiri::HTML(open("http://www.broadway.com/shows/tickets/?page=1"))
    #binding.pry
    top_20_shows = []
    # all shows to iterate through : 
    doc.css("div.grid-container .row-wrapper .grid-poster-unit").each do |show|
      #obtain info from each show:
      show_obj = self.new
      show_obj.name = show.css(".h4.show-title a").text
      show_obj.theater = show.css(".show-info li[2]").text
      show_obj.running_time = show.css(".show-info li[3] span").text
      top_20_shows << show_obj
    end
    top_20_shows 
  end


end


















