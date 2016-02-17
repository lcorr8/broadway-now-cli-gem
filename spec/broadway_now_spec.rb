require 'spec_helper'

describe BroadwayNow do
  it 'has a version number' do
    expect(BroadwayNow::VERSION).not_to be nil
  end


#pseudo code for tests:

#  CLI expectations
#    greets user
#    uses show master list (@@all) in order to list all shows (puts 20 shows)
#    allows user to obtain more information on a show, return to the mai list, or exit the program, puts error message when input is inappropriate.
#    goodbye.

#  Show expectations: (currently has the aility to do this but it doesnt get called here, it gets called in cli class)
#    create show objects
#    assign attributes to shows
#    makes a master list of the 20 shows

#  Scraper expectations
#    scrape a list of the 20 most popular broadway shows from broadway.com
#    for each show scrape the name, theater, show duration and intermission, and show url
#  use show url to scrape show story and ticket price.    



end
