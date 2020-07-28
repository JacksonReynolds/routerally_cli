class APIHandler
    include HTTParty

    attr_accessor :url

    def initialize(url)
        self.url = url
    end # initialize

    def get_route_data
        binding.pry
        response = HTTParty.get(self.url)
        puts response.body
    end

    def make_routes
        self.get_route_data.each {|route| Route.new_from_api(route)}
    end

end # APIHandler