#Create constants that set the rules for how the knight can move, example [2, 1. -2, -1 etc].
#Build a function knight_moves which accepts starting positiion and ending position, have a stack and add every possioble position to the queue.
#Keep track of visited positions on the board, prevent the knight from going to the same place again

LEGAL_MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2], [-2, 1], [-1, 2]]


class Knight
    attr_reader :value, :prevValue, :history
    attr_accessor :visited 

    @@visited = []
    
    def initialize(value, prevValue = nil)
        @value = value
        @prevValue = prevValue
        @nextValue = nil
        @@visited << value
    end


end


def knight_moves(startpos, endpos)

    q = [startpos]        

    newKnight = Knight.new(startpos)

    while q.length > 0

        prev = newKnight.value
        #Work on checking for history nodes to not step on the same coordinates
        #Use @@visited variable to reject nodes that are included in the array
        #p Knight.class_variable_get(:@@visited)

        LEGAL_MOVES.map { |val|
            q << val.map.with_index { |val, idx|
                    newKnight.value[idx] + val
            }
        }

        newKnight = Knight.new(q.shift, prev)

        return newKnight.value if newKnight.value == endpos
    end
    
end


p knight_moves([0,0], [2, 1])
