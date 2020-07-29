class CommandLineInterface

    MTN_PROJECT_KEY = "200780347-89599c6f362507786b86a0c748de6a1e"

    def run 
        self.greet_user
        args_hash = self.arguments
        APIHandler.new(endpoint(args_hash)).make_routes
        self.display_routes
    end # run

    def greet_user
        puts "____________________________________________________________________________________________________________________________________________________"
        puts "Welcome to Route Rally! This command line interface uses the Mountain Project API to find climbing routes in a location provided by you, the user."
        puts "If at any time you want to exit the application, type 'exit' at any prompt."
        puts "Enjoy!"
        puts "____________________________________________________________________________________________________________________________________________________"

    end

    def endpoint(args)
        "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=#{args[:lat]}&lon=#{args[:long]}&maxDistance=#{args[:max_dist]}&minDiff=#{args[:min_diff]}&maxDiff=#{args[:max_diff]}&maxResults=#{args[:qty]}&key=#{MTN_PROJECT_KEY}"
    end # endpoint

    def arguments
        args= {}
        args[:rope] = self.get_rope?
        args[:lat], args[:long] = self.get_location
        args[:max_dist] = self.get_radius
        args[:min_diff], args[:max_diff] = self.get_difficulty_range(args[:rope])
        args[:qty] = self.get_qty
        args
    end # arguments
    
    def get_rope?
        puts "Will you be using a rope? (y/n)"
        input = gets.chomp
        self.quit?(input)
        if input[0] != 'y' && input[0] != 'n'
            puts "Please enter yes, no, or exit"
            self.get_rope?
        elsif input[0] == 'y'
            true
        else
            false
        end #if
    end # get_rope?
    
    def get_location
        puts "Please enter your desired location: (latitude SPACE longitude)"
        input = gets.chomp.split(' ')
        self.quit?(input.join)
        if input.length != 2 || input.join.match(/[a-zA-Z]/)
            puts "Please enter a valid response."
            self.get_location
        end # if
        input
    end # get_location

    def get_radius        
        puts "How large of an area are you interested in? Please provide a max distance (under 200 miles) from the location above. The default is 30 miles"
        input = gets.chomp
        self.quit?(input)
        if input.split.length != 1 || input.to_i >= 200 || input.to_i <= 0 || input.match(/\D/)
            puts "Please enter a valid radius."
            self.get_radius
        elsif input == ''
            input = '30'
        end # if
        input
    end # get_radius

    def get_difficulty_range(rope)
        puts "What difficulty range are you interested in?"
        puts "Please enter a difficulty between 0 and 15. 15 being the hardest."
        puts "If you would like to see all routes, regardless of difficulty, hit enter."
        puts "Otherwise, please use the following convention for your desired range: min_difficulty SPACE max_difficulty"
        input = gets.chomp.split(' ')
        self.quit?(input.join)        
        if input.empty? && rope # user wants all rope routes
            ['5.0','5.15']
        elsif input.empty? && !rope # user wants all boulder routes
            ['V0','V15']
        elsif input[0].to_i < 0 || input[1].to_i > 15 || input.length != 2 || input.join.match(/\D/)
            puts "Please enter a valid range."
            self.get_difficulty_range(rope)
        elsif input[0].to_i > input[1].to_i
            puts "Please follow the convention above."
            self.get_difficulty_range(rope)        
        elsif rope
            input.collect {|diff| diff.prepend("5.")}
        else 
            input.collect {|diff| diff.prepend("V")}
        end # if
    end # get_difficulty_range

    def get_qty
        puts "Please enter how many routes you would like to see, enter to use default: (Max of 500, defaults to 50)"
        input = gets.chomp
        self.quit?(input)
        if input == ''
            input = 50
        elsif input.split.length != 1 || input.match(/\D/) || input.to_i <= 0 || input.to_i > 500
            puts "Please enter a valid quatity."
            self.get_qty
        else
            input
        end # if
    end # get_qty

    def display_routes
        sorted_routes = self.sort_routes
        no_routes?(sorted_routes)
        sorted_routes.each {|route| self.display_route(route)}
        self.next_option
    end

    def no_routes?(sorted_routes)
        if sorted_routes.empty?
            puts "There are no routes in the area you specified. If you would like to try again, type 'again', otherwise type 'exit'."
            input = gets.chomp
            self.quit?(input)
            if input == 'again'
                self.run
            else
                puts "Please enter one of the choices above."
                self.no_routes(sorted_routes)
            end
        end
    end

    def next_option        
        puts "If you would like to look at a particular route, enter the route ID."
        puts "If you would like to re-sort, enter 'sort'"
        puts "If you want to search for a different set of routes, enter 'again'"
        input = gets.chomp
        self.quit?(input)
        if input == 'sort'
            self.display_routes
        elsif input == 'again'
            self.run
        elsif input.length == 9 
            route = Route.find_by_id(input)
            self.display_route(route)
            self.next_option
        end
    end

    def sort_routes
        puts "How would you like to sort the routes?"
        puts "Enter: name, rating (difficulty) or stars"
        input = gets.chomp
        self.quit?(input)
        if input == 'name'
            sorted_routes = Route.all.sort {|a,b| a.name <=> b.name}
        elsif input == "rating"
            sorted_routes = Route.all.sort {|a,b| a.rating <=> b.rating}
        elsif input == 'stars'
            sorted_routes = Route.all.sort {|a,b| a.stars <=> b.stars}
        else
            puts "Please enter a valid sort method."
            self.sort_routes
        end
        sorted_routes
    end

    def display_route(route)
        puts "       ID: #{route.id}"
        puts "     Name: #{route.name}"
        puts "     Type: #{route.type}"
        puts "   Rating: #{route.rating}"
        puts "    Stars: #{route.stars}"
        puts "  Pitches: #{route.pitches}"
        puts " Location: #{route.location}"
        puts " Latitude: #{route.latitude}"
        puts "Longitude: #{route.longitude}"
        puts "      URL: #{route.url}"
        puts "_______________________________________\n"
    end

    def quit?(input)
        abort("Goodbye!") if input == 'exit'
    end # quit

end #CommandLineInterface