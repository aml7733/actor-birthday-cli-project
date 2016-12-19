require_relative "../config/environment.rb"

class Actor
  attr_accessor :name, :location, :profile_url, :occupations, :bio_intro, :known_for, :trivia_fact

  @@all = []

  def initialize(attribute_hash)
    @name = attribute_hash[:name]
    @location = attribute_hash[:location]
    @profile_url = attribute_hash[:profile_url]

    @@all << self
  end

  def self.create_from_array(actor_hash_array)
    actor_hash_array.each { |actor_hash| self.new(actor_hash) }
  end

  def add_attributes(attributes_hash)
    attributes_hash.each do |attr_name, value|
      self.attr_name = value
    end
  end
end

# Want attr_accessor for :name, :location, :year, :profile_url, :occupations, :bio_intro, :known_for, :trivia_fact

# Has @@all, class method for retrieval

# initialize takes attribute hash (could use send and iterator, but hash will always be the same...) and initializes actor with named variables.  pushes new actor to @@all

# self.create_from_hashes(actorhash_array) takes in array of hashes with :name, :year, :location, :profile_url and creates an actor for each element with the appropriate values saved.

# add_attributes(attributes_hash) instance method - takes a hash with attribute key-value pairs and adds those attributes to the instance of actor called upon
