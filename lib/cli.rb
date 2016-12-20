require_relative "../config/environment.rb"

class ActorBirthdayCLI
  def initialize
  end

  def self.run
    puts "Hello! Welcome to the IMDB Birthday Gem!"

    actor_hashes = Scraper.scrape_date_page

    puts "Today is #{Scraper.today}. The following ladies and gentlemen were born today:"
    puts "----------------------"
    Actor.create_from_array(actor_hashes)
    Actor.all.each do |actor|
      puts "#{actor.name}, born this day in #{actor.year}.\n"
    end

    puts "Please enter the name of the actor for whom you'd like more information (or 'done' if you're done):"
    input = gets.strip

    until input == 'done'



      Actor.all.each do |actor|
        if actor.name == input
          attributes_hash = Scraper.scrape_profile_page(actor.profile_url)
          actor.add_attributes(attributes_hash)
          selected_actor = actor
        end
      end
    end

  #  make_actors #from imdb/date

    #display_actors #displays actor attributes in pretty way, asks if the user would like to see more info on a particular actor

    #receive input from user.

    #if no, goodbye message, end program.
    #if (actor name?), run add_attributes on the actor selected and display actor attributes.

    #ask if user would like to see the list of actors again.
end
