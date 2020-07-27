class CommandLineInterface

    API_KEY = "200780347-89599c6f362507786b86a0c748de6a1e"

    def run
        # print greeting
        # ask if the user is using a rope or not (y/n)
        rope = self.get_rope?
        # ask the user what langitude and latitude they are interested in
        lat, long = self.get_location
        # ask for range from that location
        max_dist = get_radius
        # ask for difficulty range (verify that it's a boulder or rope grade)
        min_diff, max_diff = get_difficulty_range
        # ask how the user wants the routes to be sorted (by name, by rating, by difficulty)
        puts "By default, the routes will be listed by Region and Zone (climbing area)."
        puts "How would you like the routes in each Zone to be ordered? "

    end # run
    
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
        if input.length != 2 || !input.all? {|a| a.to_f != 0.0}
            puts "Please enter a valid response."
            self.get_range
        end # if
        input
    end # get_location

    def get_radius        
        puts "How large of an area are you interested in? Please provide a max distance (under 500 miles) from the location above."
        input = gets.chomp
        if input.split.length != 1 || input.to_i > 500 || input.to_i < 0
            puts "please enter a valid radius to look for climbs."
            self.get_radius
        end # if 
    end # get_radius

    def get_difficulty_range
        puts "What difficulty range are you interested in?"
        puts "NOTE: If you are climbing with a rope, you must enter a range between 5.0 and 5.15" if rope
        puts "NOTE: If you are bouldering, you must enter a range between V0 and V16." if !rope
        puts "If you would like to see all routes, regardless of difficulty, hit enter."
        puts "Otherwise, please use the following convention for your desired range: min_difficulty SPACE max_difficulty"
        diff_range = gets.chomp
        self.valid_diff_range?(diff_range)
        if diff_range == ""
            continue
        else
            min_diff, max_diff = diff_range.split(' ')
        end # if
    end # get_difficulty_range

    def quit?(input)
        abort("Goodbye!") if input == 'exit'
    end # quit

end #CommandLineInterface