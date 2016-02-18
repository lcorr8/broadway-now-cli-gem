
class BroadwayNow::CLI

  def call
    greet
    make_shows
    add_attributes
    list_shows 
    menu
    goodbye
  end 

  def greet
    puts "-----Welcome to Broadway Now!-----"
  end
  
  def make_shows
    shows_array = BroadwayNow::Scraper.main_scraper
    BroadwayNow::Show.create_shows(shows_array)
  end

  def add_attributes 
    BroadwayNow::Show.all.each do |show|
      url = show.url
      extra_info_hash = BroadwayNow::Scraper.additional_scraper(url)
      show.add_info(extra_info_hash)
    end
  end

  def list_shows
    puts "-----Shows currently running:-----"
    @shows = BroadwayNow::Show.all
    @shows.each.with_index(1) do |show,i|
      puts "#{i}. #{show.name}"
    end
    puts "----------------------------------"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter show number for more info, 'all' to see all shows, or 'exit' :"
      input = gets.strip.downcase

      if input.to_i > 0 &&  input.to_i < 21 #update if you add more shows
        show = @shows[input.to_i-1] 
        puts "--------------------Details--------------------"
        puts "     Show:             #{show.name}"
        puts "     Theater:         #{show.theater}"
        puts "     Price:            #{show.price}"
        puts "     Website:          #{show.url}"
        puts "     Running Time:     #{show.running_time}"
        puts "\nStory: \n"
        puts "#{show.story}"
        puts "---------------------------------------------"

      elsif input == "all" 
        list_shows
      elsif input == "exit"
        goodbye
      else
        puts "Oops! Incorrect input! Enter show number for more info, 'all' to see all shows, or 'exit' :"  
      end 
    end   
  end

  def goodbye
    puts "Goodbye!"
    exit 0
  end

end