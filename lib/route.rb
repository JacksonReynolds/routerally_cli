class Route
    extend Commons::ClassMethods
    include Commons::InstanceMethods

    attr_accessor :name, :style, :grade, :zone, :region, :stars, :url, :pitches, :id

    @@all = []
    
    def initialize (route_hash)
        route_hash.each {|key, value| self.send(("#{key}="), value)}
        self.save
    end #initialize

    def self.all
        @@all
    end #self.all
end # Route