require_relative "../config/environment.rb"

class Actor
  # Want attr_accessor for :name, :location, :year, :profile_url, :occupations, :bio_intro, :known_for, :trivia_fact

  # Has @@all, class method for retrieval

  # initialize takes attribute hash (could use send and iterator, but hash will always be the same...) and initializes actor with named variables.  pushes new actor to @@all

  # self.create_from_hashes(actorhash_array) takes in array of hashes with :name, :year, :location, :profile_url and creates an actor for each element with the appropriate values saved.

  # add_attributes(attributes_hash) instance method - takes a hash with attribute key-value pairs and adds those attributes to the instance of actor called upon
end
