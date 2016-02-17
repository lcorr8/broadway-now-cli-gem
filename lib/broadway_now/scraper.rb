class BroadwayNow::Scraper

  def self.main_scraper
    doc = Nokogiri::HTML(open("http://www.broadway.com/shows/tickets/?page=1"))
    shows_array = []

    doc.css("div.grid-container .row-wrapper .grid-poster-unit").each do |show|
      name = show.css(".h4.show-title a").text
      url = "http://www.broadway.com"+show.css(".h4.show-title a").attribute("href").value
      theater = show.css(".show-info li[2]").text
      running_time = show.css(".show-info li[3] span").text

      shows_array << {name: name, url: url, theater: theater, running_time: running_time}
      
    end
    shows_array
#binding.pry
  end

  def self.additional_scraper(url)
    more = Nokogiri::HTML(open(url))
    story = more.css(".gray-dk.inner-content-bold p").first.text
    price = more.css(".man.blue-link-lt").text

    extra_info_hash = {story: story, price: price}
  end

end
#require 'nokogiri'
#require 'open-uri'
#require 'pry'


#class Scraper
 # def self.scrape_index_page(index_url)
  #  doc = Nokogiri::HTML(open(index_url))
   # binding.pry
  #end  
#scrape_index_page("http://www.broadway.com/shows/tickets/")


#end


#page 1: first 20 shows
# url:   "http://www.broadway.com/shows/tickets/"
#you'll have to iterate through these and get this info:
#doc.css("div.grid-container .row-wrapper").first.text.strip
# show title:       doc.css(".h4.show-title a").text
# show theater:     doc.css(".show-info li[2]").text
# show duration/intermission:      doc.css(".show-info li[3] span").text


#parse extra info from show page
#url: http://www.broadway.com/shows/the-lion-king/
#no iteration, just pull info, use show_obj.url info
# show story: more.css(".gray-dk.inner-content-bold p")
#price : more.css(".man.blue-link-lt").text