

class Region

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.all << self
    end # initialize

    def self.all
        @@all
    end # self.all

    def zones
        Zone.all.select {|zone| zone.region == self}
    end # zones



end # Region