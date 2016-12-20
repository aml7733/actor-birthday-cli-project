require_relative "../config/environment.rb"

class ActorBirthdayCLI
  def initialize
  end

  def run
    puts "Hello! Welcome to the IMDB Birthday Gem!"

    birthday_display

    input = nil
    until input == 'no'
      puts "Please enter the name of the actor for whom you'd like more information (or 'no' if you're done):"
      input = gets.strip

      if input != 'no'
        Actor.all.each do |actor|
          if actor.name == input
            attributes_hash = Scraper.scrape_profile_page(actor.profile_url)
            actor.add_attributes(attributes_hash)
            actor.display
            break
          end
        end

        puts "Would you like to see the birthday list again? (yes/no)"
        input = gets.strip

        if input != 'no'
          birthday_display
        end
      end
    end
    puts "Toodles!"
  end

  def birthday_display
    actor_hashes = Scraper.scrape_date_page

    puts "Today is #{Scraper.today}. The following ladies and gentlemen were born today:"
    puts "----------------------"
    Actor.create_from_array(actor_hashes)
    Actor.all.each do |actor|
      puts "#{actor.name}, born this day in #{actor.year}.\n"
    end
  end
end
