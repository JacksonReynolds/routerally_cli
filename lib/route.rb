class Route
    extend Commons::ClassMethods
    include Commons::InstanceMethods

    attr_accessor :id, :name, :type, :rating, :stars, :pitches, :location, :url, :longitude, :latitude

    @@all = []
    
    def initialize (attr_hash)
        route_hash.each {|key, value| self.send(("#{key}="), value)}
        self.save
    end #initialize

    def self.create(name)
        a = self.new(name)
        a.save
        a
    end # self.create

    def self.find_by_id(id)
        self.all.find {|a| a.id == id.to_i}
    end # self.find_by_name

    def self.all
        @@all
    end #self.all

    def self.reset!
        self.all.clear
    end

    def save
        self.class.all << self
    end #save

    def self.new_from_api(route_hash)
        binding.pry
    end
end # Route