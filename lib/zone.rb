require_relative './concerns/commons.rb'
require_relative './region.rb'
require 'pry'

class Zone
    extend Concerns::ClassMethods
    include Concerns::InstanceMethods

    attr_accessor :name, :region

    def initialize(name, region=nil)
        super
        @region = region
    end #initialize

    def routes
        Route.all.select {|route| route.zone = self}
    end # routes

end # Zone

binding.pry