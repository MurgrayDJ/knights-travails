#Author: Murgray D. John
#Date: 4/7/2023
#Purpose: Shows the shortest way for a knight to get from one square to another.

class Knight_Travails
  class Board
    attr_reader :start_node
    attr_accessor :history

    def initialize(start_pos)
      start_node = Node.new(start_pos)
    end
  end

  class Node
      attr_accessor :coordinate
      attr_accessor :parent
      attr_accessor :children

      MOVES = [[-1,-2], [-1,2], 
                [1,-2], [1,2], 
                [-2,-1], [-2,1], 
                [2,-1], [2,1]].freeze

      def initialize(coordinate, parent=nil)
        @coordinate = coordinate
        @parent = parent
        @children = []
      end

      def create_children(parent)
        children = []
        
      end
  end

  attr_accessor :board
  attr_accessor :knight

  def initialize(start_pos, end_pos)
    @board = create_board(start_pos)
  end
end
