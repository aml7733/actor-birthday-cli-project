require_relative "../config/environment.rb"

class Scraper
  # self.scrape_date_page => should use open uri to target site ("https://www.imdb.com/date" - doesn't need argument, same site every time), use nokogiri to separate out actors into array of xml actor elements, then set up a hash for each actor with :name, :year, :location, and :profile_url keys.  Should return array of actor hashes

  #self.scrape_profile_page(profile_url) => use open uri to open profile page, use nokogiri return hash of attributes key-value pairs (bio intro paragraph, etc.)
  puts "This is the scraper."
end
