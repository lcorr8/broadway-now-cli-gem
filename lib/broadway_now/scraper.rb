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
  end

  def self.additional_scraper(url)
    more = Nokogiri::HTML(open(url))
    story = more.css(".gray-dk.inner-content-bold p").first.text
    price = more.css(".man.blue-link-lt").text

    extra_info_hash = {story: story, price: price}
  end

end

