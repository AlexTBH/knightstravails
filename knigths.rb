#Create constants that set the rules for how the knight can move, example [2, 1. -2, -1 etc].
#Build a function knight_moves which accepts starting positiion and ending position, have a stack and add every possioble position to the queue.
#Keep track of visited positions on the board, prevent the knight from going to the same place again

LEGAL_MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2], [-2, 1], [-1, 2]]


class Knight
    attr_reader :value, :prevValue, :history, :visited
    attr_accessor :visited

    @@visited = []
    
    def initialize(value = nil, prevValue = nil)
        @value = value
        @prevValue = prevValue
        @@visited << value unless @@visited.include?(value)
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end

    def self.visited?(val)
        @@visited.include?(val)
    end
end 


def knight_moves(startpos, endpos)

    newKnight = Knight.new(startpos)

    q = []
    
    q << newKnight

    while q.length > 0


        prev = q.shift
        return if prev.value == endpos
        #This is where the Knight determines which steps to include in the stack next, this is done by creating knight objects with the next steps

        
        ### Figure out why val = 0,0 and prevval = nil appears multiple times

        LEGAL_MOVES.each do |val|
            temp = val.map.with_index { |val, idx| prev.value[idx] + val
                (prev.value[idx] + val)}

        ### try to check node in already visited instead of temp
            if valid_move?(temp) && already_visited?(temp)
                knight = Knight.new(temp, prev)
                q << knight
            end
        end

        
        ###### WORK HERE #######

        
        #if knight.value == endpos
        #    while knight.prevValue == true
        #        puts knight.prevValue
        #        tempKnight = knight.prevValue
        #    end
        #end
        ###### WORK HERE #######

        ######
        #Create an if statement to check wheter to create new steps, or if the endpos is already reached
        #If the endpos is already reached, returned the current value and prevvalues

        ######


        #p Knight.class_variable_get(:@@visited)
        
        

    end
    
end

def valid_move?(val)
    return true if val[0] < 8 && val[0] > 0 && val[1] < 8 && val[1] > 0 && val
end

def already_visited?(val)
    return true unless Knight.visited?(val)
end



knight_moves([0,0], [4, 2])
p Knight.all

