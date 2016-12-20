# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application #see cli.rb
- [x] Pull data from an external source #Scraper class uses imdb.com/date for initial list of actors born today
- [x] Implement both list and detail views #Scraper class can use stored profile url, scrape profile page, and return attribute hash.  Actor class has display function, called in cli.
