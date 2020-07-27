class Region
    extend Commons::ClassMethods
    include Commons::InstanceMethods

    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end # self.all

    def zones
        Zone.all.select {|zone| zone.region == self}
    end # zones
end # Region