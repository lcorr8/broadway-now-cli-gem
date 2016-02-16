class BroadwayNow::Scraper
  

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