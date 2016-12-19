require "open-uri"
require "nokogiri"
require "pry"

class Scraper
  attr_accessor :today

  def self.scrape_date_page
    html = open("http://www.imdb.com/date")
    doc = Nokogiri::HTML(html)
    @today = doc.css("div#main h2").text
    actors = []

    actor_xmls = doc.css("div#main ul li")
    actor_xmls.each do |actor_xml|
      actors << {
        :name => actor_xml.css("a").text,
        :year => actor_xml.text[/\d{4}/],
        :profile_url => ("http://www.imdb.com" + actor_xml.css("a").attribute("href").value)
      }
    end
  end
  # self.scrape_date_page => should use open uri to target site ( - doesn't need argument, same site every time), use nokogiri to separate out actors into array of xml actor elements, then set up a hash for each actor with :name, :year, :location, and :profile_url keys.  Should return array of actor hashes

  #self.scrape_profile_page(profile_url) => use open uri to open profile page, use nokogiri return hash of attributes key-value pairs (bio intro paragraph, etc.)
end

Scraper.scrape_date_page
