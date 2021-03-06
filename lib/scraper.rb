require "open-uri"
require "nokogiri"
require "pry"

class Scraper

  @@today = nil

  def self.today
    @@today
  end

  def self.scrape_date_page
    html = open("http://www.imdb.com/date")
    doc = Nokogiri::HTML(html)
    # they completely redesigned the css for the imdb date page, need to re-do scraper
    @@today = doc.css("div#main h1").text.split[4]
    actors = []

    actor_xmls = doc.css("div#main ul li")
    actor_xmls.each do |actor_xml|
      actors << {
        :name => actor_xml.css("a").text,
        :year => actor_xml.text[/\d{4}/],
        :profile_url => ("http://www.imdb.com" + actor_xml.css("a").attribute("href").value)
      }
    end
    actors
  end

  def self.scrape_profile_page(profile_url)
    html = open("#{profile_url}")
    doc = Nokogiri::HTML(html)

    bio_text = doc.css("div.name-trivia-bio-text div.inline").text.split.join(" ").strip
    bio_text = bio_text.slice(0..(bio_text.index("...") + 2))

    known_for_list = []
    known_for_titles = doc.css("div.article div#knownfor div.knownfor-title")

    known_for_titles.each do |title|
      tag = ""
      tag << title.css("div.knownfor-title-role a").text + " "
      tag << title.css("div.knownfor-year").text + ", as "
      tag << title.css("div.knownfor-title-role span.knownfor-ellipsis").text + "."
      known_for_list << tag
    end

    attributes = {
      :occupations => doc.css("div#name-job-categories a").text.split.join(" "),
      :bio_intro => bio_text,
      :known_for => known_for_list
    }

  end
end
