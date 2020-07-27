require 'pry'
require_relative './concerns/commons.rb'
require_relative './zone.rb'

class Region
    extend Concerns::ClassMethods
    include Concerns::InstanceMethods

    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end # self.all

    def zones
        Zone.all.select {|zone| zone.region == self}
    end # zones

end # Region




