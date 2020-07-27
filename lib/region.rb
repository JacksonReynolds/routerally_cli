require 'pry'

class Region

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
    end # initialize

    def self.all
        @@all
    end # self.all

    def self.create(name)
        a = self.new(name)
        self.all << a
    end # self.create

    def self.find_by_name(name)
        self.all.select {|a| a.name == name}
    end # self.find_by_name

    def self.find_or_create_by_name(name)
        inst = self.find_by_name(name)
        inst ? inst : self.create(name)
    end # find_or_create_by_name

    def zones
        Zone.all.select {|zone| zone.region == self}
    end # zones

end # Region

tenn = Region.create('Tennessee')

binding.pry

