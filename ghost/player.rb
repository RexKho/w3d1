    
    
    
    
class Player 
    def initialize(name)
        @name = name

    end

    def alert_invalid_guess(str)
        if str.length != 1
            raise "Only put one letter please"
        end
        if str.is_a?(Integer)

        end

    end

    def guess
        puts "Enter your letter"
        gets.chomp.downcase
    end

end