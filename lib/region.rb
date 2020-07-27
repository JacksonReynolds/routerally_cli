

class Region

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.all << self if self.all.include?()
    end # initialize

    def self.all
        @@all
    end # self.all

    def self.create(name)
        new_region = self.new(name)
    end # self.create

    def zones
        Zone.all.select {|zone| zone.region == self}
    end # zones

end # Region