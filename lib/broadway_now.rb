require 'open-uri'
require 'nokogiri'
require 'pry' #remove this and dependency when ready to puclish

require_relative "./broadway_now/version"
require_relative "./broadway_now/cli"
require_relative "./broadway_now/show"
require_relative "./broadway_now/scraper"

#module BroadwayNow
  # Your code goes here...
#end
#removed this ^ bc version sets up a module BroadwayNow and this file requires the version file.
