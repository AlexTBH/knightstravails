#Create constants that set the rules for how the knight can move, example [2, 1. -2, -1 etc].
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

        #This is where the Knight determines which steps to include in the stack next, this is done by creating knight objects with the next steps
        
        LEGAL_MOVES.each do |val|
            temp = val.map.with_index { |val, idx| prev.value[idx] + val
                (prev.value[idx] + val)}

            if valid_move?(temp) && already_visited?(temp)
                knight = Knight.new(temp, prev)
                return if correctSpot?(knight, endpos) == true
                q << knight
            end
        end

        #p Knight.class_variable_get(:@@visited)
        p q
    end
end

def correctSpot?(knight, endpos)

    if knight.value == endpos

        currentKnight = knight
        tempKnight = ""

        while currentKnight.prevValue != nil
            p currentKnight.value
            tempKnight = currentKnight.prevValue
            currentKnight = tempKnight
        end
    return true
    end

end

def valid_move?(val)
    return true if val[0] < 8 && val[0] > 0 && val[1] < 8 && val[1] > 0 && val
end

def already_visited?(val)
    return true unless Knight.visited?(val)
end


knight_moves([0,0], [4, 2])
