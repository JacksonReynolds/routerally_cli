class APIHandler
    include HTTParty

    attr_accessor :url

    def initialize(url)
        self.url = url
    end # initialize

    def get_route_data
        self.class.get(self.url)
    end

end # APIHandler