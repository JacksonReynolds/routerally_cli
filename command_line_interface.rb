class CommandLineInterface

    API_KEY = "200780347-89599c6f362507786b86a0c748de6a1e"

    def 
        # print greeting
        # ask if the user is using a rope or not (y/n)
        puts "Will you be using a rope? (y/n)"
        rope? = gets.chomp
        # ask the user what langitude and latitude they are interested in
        puts "Please enter your location: (lat SPACE long)"
        lat, long = gets.chomp.split(" ").to_f
        # ask for range from that location
        puts "How large of an area are you interested in? (miles)"
        max_dist = gets.chomp
        # ask for difficulty range (verify that it's a boulder or rope grade)
        puts "What difficulty range are you interested in? NOTE: If you are climbing with a rope, you must enter a range between 5.0 and 5.15, otherwise (if you're bouldering) you must enter a range between V0 and V16."
        puts "If you would like to see all routes, regardless of difficulty, hit enter."
        puts "Otherwise, please use the following convention for your desired range: min_difficulty SPACE max_difficulty"
        min_diff, max_diff = gets.chomp.split(' ').
        # ask how the user wants the routes to be sorted (by name, by rating, by difficulty)
        puts "By default, the routes will be listed by Region and Zone (climbing area)."
        puts "How would you like the routes in each Zone to be ordered? "

    end # run

end #CommandLineInterface