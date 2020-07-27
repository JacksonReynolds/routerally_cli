module Concerns

    module ClassMethods

        def create(name)
            a = self.new(name)
        end # self.create
    
        def find_by_name(name)
            self.all.select {|a| a.name == name}
        end # self.find_by_name
    
        def find_or_create_by_name(name)
            inst = self.find_by_name(name)
            inst ? inst : self.create(name)
        end # find_or_create_by_name

    end # ClassMethods

    module InstanceMethods

        def initialize(name)
            @name = name
            self.class.all << self
        end #initialize

    end # InstanceMethods

end # Concerns