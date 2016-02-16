class BroadwayNow::Show
  attr_accessor :name, :theater, :running_time, :url, :story, :price#, :cast

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
      url = "http://www.broadway.com"+show.css(".h4.show-title a").attribute("href").value
      show_obj.url = url
      show_obj.theater = show.css(".show-info li[2]").text
      show_obj.running_time = show.css(".show-info li[3] span").text
      #scrape_more(url) #return show_obj.story and potentially price.
      more = Nokogiri::HTML(open(url))
      show_obj.story = more.css(".gray-dk.inner-content-bold p").first.text
      show_obj.price = more.css(".man.blue-link-lt").text
      top_20_shows << show_obj
    end
    top_20_shows 
  end

  #def scrape_more(url) #show_obj.url #should this be self.scrape_more?
   # doc = Nokogiri::HTML(open(url)) #"http://www.broadway.com/shows/the-lion-king/"
    #self.story = doc.css(".gray-dk.inner-content-bold p").text
  #end



end


















