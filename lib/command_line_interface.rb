class CommandLineInterface

    API_KEY = "200780347-89599c6f362507786b86a0c748de6a1e"

    def run
        # print greeting
        # ask if the user is using a rope or not (y/n)
        rope = self.get_rope?
        # ask the user what langitude and latitude they are interested in
        lat, long = self.get_range
        puts lat + long
        # ask for range from that location
        puts "How large of an area are you interested in? (miles)"
        max_dist = gets.chomp
        # ask for difficulty range (verify that it's a boulder or rope grade)
        puts "What difficulty range are you interested in? NOTE: If you are climbing with a rope, you must enter a range between 5.0 and 5.15, otherwise (if you're bouldering) you must enter a range between V0 and V16."
        puts "If you would like to see all routes, regardless of difficulty, hit enter."
        puts "Otherwise, please use the following convention for your desired range: min_difficulty SPACE max_difficulty"
        diff_range = gets.chomp
        self.valid_diff_range?(diff_range)
        if diff_range == ""
            continue
        else
            min_diff, max_diff = diff_range.split(' ')
        end # if

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
    
    def get_range
        puts "Please enter your desired location: (latitude SPACE longitude)"
        input = gets.chomp
        self.quit?(input)
        if !input.include?(' ')
            puts "Please enter a valid response."
            self.get_range
        end # if
        loc = input.split(' ')
    end # get_range

    def quit?(input)
        abort("Goodbye!") if input == 'exit'
    end # quit

end #CommandLineInterface