class Route
    attr_accessor :id, :name, :type, :rating, :stars, :pitches, :location, :url, :longitude, :latitude

    @@all = []
    
    def initialize (attr_hash)
        attr_hash.each {|key, value| self.send(("#{key}="), value)}
        self.save
    end #initialize

    def self.find_by_id(id)
        self.all.detect {|a| a.id == id.to_i}
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
        attr_hash = {
            id: route_hash['id'],
            name: route_hash['name'],
            type: route_hash['type'],
            rating: route_hash['rating'],
            stars: route_hash['stars'],
            pitches: route_hash['pitches'],
            location: route_hash['location'],
            url: route_hash['url'],
            longitude: route_hash['longitude'],
            latitude: route_hash['latitude']
        }
        self.new(attr_hash)
    end
end # Route