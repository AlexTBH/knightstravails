#Create constants that set the rules for how the knight can move, example [2, 1. -2, -1 etc].
#Build a function knight_moves which accepts starting positiion and ending position, have a stack and add every possioble position to the queue.
#Keep track of visited positions on the board, prevent the knight from going to the same place again

LEGAL_MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2], [-2, 1], [-1, 2]]


class Knight
    attr_reader :value, :prevValue, :history, :visited
    attr_accessor :visited

    @visited = []
    
    def initialize(value = nil, prevValue = nil)
        @value = value
        @prevValue = prevValue
        @visited << value unless @visited.include?(value)
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end

end 


def knight_moves(startpos, endpos)

    q = []
    
    q << startpos

    newKnight = Knight.new(startpos)

    while q.length > 0

        #Work on when to stop the while loop, when endpos == ?

        return if q[0] == endpos

        prev = q.shift

        #Build the code with only que, remove stack

        #This is where the Knight determines which steps to include in the stack next, this is done by creating knight objects with the next steps
        
        def valid_move?(val)
            return true if val[0] < 8 && val[0] > 0 && val[1] < 8 && val[1] > 0 && val
        end

        def already_visited?(val)
            return true unless @visited.include?(val) 
        end

        knight = ""

        LEGAL_MOVES.each do |val|
            temp = val.map.with_index { |val, idx| prev[idx] + val
                (prev[idx] + val)}
            if valid_move?(temp) && already_visited?(temp)
                knight = Knight.new(temp, prev)
                q << knight.value
            end
        end



        ######
        #Create an if statement to check wheter to create new steps, or if the endpos is already reached
        #If the endpos is already reached, returned the current value and prevvalues

        ######


        #p Knight.class_variable_get(:@@visited)
        

    end
    
end


knight_moves([0,0], [2, 1])
#p Knight.all

