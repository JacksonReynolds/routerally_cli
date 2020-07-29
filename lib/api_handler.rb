class APIHandler

    attr_accessor :url

    def initialize(url)
        self.url = url
    end # initialize

    def get_route_data
        response = HTTParty.get(self.url)
    end

    def make_routes
        Route.reset!
        self.get_route_data["routes"].each do |route_attrs| 
            Route.new_from_api(route_attrs)
        end
    end

end # APIHandler