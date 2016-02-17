#outline

 x 1. plan gem, imagine interface.
 x 2. start with project structure- google
 x 3. start with entry point - the file run.
 x 4. force that to build the CLI interface.
 x 5. stub out the interface.
 x 6. start making things real.
 x 7. discover objects
 x 8. program

- a command line inteface for broadway shows, starting with broadway.com

user types in: broadway-now

show a list of all the broadway shows currently playing

1. Lion King
2. The Book of Mormon
3. Wicked
4. Aladdin
...
20. Hughie

which show would you like to learn more about?

1


object attributes (shows) - What is a show?
a show has a name
a show has a theater
a show has a running time and intermission
a show has a ticket price
a show has a URL
a show has a story
a show has a cast (optional)

url:"http://www.broadway.com/shows/tickets/"
you'll have to iterate through these and get this info:
doc.css("div.grid-container .row-wrapper").first.text.strip
show title:       doc.css(".h4.show-title a").text
show theater:     doc.css(".show-info li[2]").text
show duration/intermission:      doc.css(".show-info li[3] span").text

parse extra info from show page
no iteration, just pull info, use show_obj.url info
show story: more.css(".gray-dk.inner-content-bold p")
price: more.css(".man.blue-link-lt").text

--------------------part 2 --------------------------------------

x 1. index scraper, should make a shows array(but 
  not of instances only of hashes with their future instance's attributes [for mass assignment]. each member of the array with the info that can be pulled from the main page. the info should come as a hash! this method takes in a url as an attribute.

x 2. more info scraper, should receive a show's 
  url. make another hash with story and price attributes.

-0-

Show class

x 3.(1) will create an instance of a show, from the hash 
  within the shows array (from index scraper). 

x 4.(1) if you use mass assignment in initialize when this 
  object is instantiated then it will have the following attributes: name,theater, running time, and url. add instance to an @@all.

x 5.(2) will mass assign the info from additional info hash (
  story and price) to self()

x 6.make a reader for @@all 

today currently connects scraped show info and cli for display.
connect new scraped info with cli.

-0-

cli

call: make shows(1,3), add extra info(6,2,5), display shows (maybe leave display hard coded in cli for now). 

make sure to link all to cli display. for display of most popular 20 shows.






































