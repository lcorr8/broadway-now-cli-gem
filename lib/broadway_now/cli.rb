
#this is a CLI controller:
#welcomes user, and deals with input.
class BroadwayNow::CLI

  #def initialize
  #end 

  def call
    
    list_shows
    menu
    goodbye
  end 

  def list_shows
    #it will eventually get actual shows
    #for now we continue with a stub
    puts "-----Shows currently running:-----"
    
    @shows = BroadwayNow::Show.today
    @shows.each.with_index(1) do |show,i|
      puts "#{i}. #{show.name}"
    end
    puts "---------------"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter show number for more info, 'all' to see all shows, or 'exit' :"
      input = gets.strip.downcase

      if input.to_i > 0
        show = @shows[input.to_i-1] 
        puts "--------------------Details--------------------"
        puts "     Show:             #{show.name}"
        puts "     Theater:         #{show.theater}"
        puts "     Website:          #{show.url}"
        puts "     Running Time:     #{show.running_time}"
        puts "\nStory: \n"
        puts "#{show.story}"
        puts "---------------------------------------------"
        #puts "Price: #{show.price}"
        
      elsif input == "all" 
        list_shows
      elsif input == "exit"
        goodbye
      else
        puts "Oops! incorrect input! Enter the number of a show for more info, 'all' for a list of all shows currently running, or 'exit' to leave Broadway Now."  
      end 
    end   
  end

  def goodbye
    puts "Goodbye!"
    exit 0
  end


end