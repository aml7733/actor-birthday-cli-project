require_relative "../config/environment.rb"

url = Scraper.scrape_date_page.first[:profile_url]

Scraper.scrape_profile_page(url)
