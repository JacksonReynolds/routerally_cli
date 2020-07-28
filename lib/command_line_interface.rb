class CommandLineInterface

    MTN_PROJECT_KEY = "200780347-89599c6f362507786b86a0c748de6a1e"

    def run 
        self.greet_user
        args_hash = self.selections
        binding.pry
        # self.get_data
        # self.
    end # run

    def greet_user

    end # greet_user

    def selections
        args= {}
        args[:rope] = self.get_rope?
        args[:lat], args[:long] = self.get_location
        args[:max_dist] = self.get_radius
        args[:min_diff], args[:max_diff] = self.get_difficulty_range(args[:rope])
        args
    end # selections
    
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
        puts "How large of an area are you interested in? Please provide a max distance (under 500 miles) from the location above. The default is 30 miles"
        input = gets.chomp
        self.quit?(input)
        if input.split.length != 1 || input.to_i > 500 || input.to_i <= 0 || input.match(/\D/)
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
        if input.empty?
            ['','']
        elsif input[0].to_i < 0 || input[1].to_i > 15 || input.length != 2 || input.join.match(/\D/)
            puts "Please enter a valid range."
            self.get_difficulty_range(rope)
        elsif input[0] > input[1]
            puts "Please follow the convention above."
            self.get_difficulty_range(rope)
        elsif rope
            input.collect {|diff| diff.prepend("5.")}
        else 
            input.collect {|diff| diff.prepend("V")}
        end # if
    end # get_difficulty_range

    def quit?(input)
        abort("Goodbye!") if input == 'exit'
    end # quit

end #CommandLineInterface