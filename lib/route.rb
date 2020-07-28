class Route
    extend Commons::ClassMethods
    include Commons::InstanceMethods

    attr_accessor :name, :style, :grade, :location, :stars, :url, :pitches, :id, :coords

    @@all = []
    
    def initialize (attr_hash)
        route_hash.each {|key, value| self.send(("#{key}="), value)}
        self.save
    end #initialize

    def self.all
        @@all
    end #self.all

    # def self.new_from_api(route_hash)
    #     attr_hash = {}
    #     attr_hash[:name] = route_has
    # end
end # Route