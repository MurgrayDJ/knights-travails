#Author: Murgray D. John
#Date: 4/7/2023
#Purpose: Shows the shortest way for a knight to get from one square to another.

class Knight_Travails
  class Board
    attr_reader :start_node
    attr_accessor :history
    MOVES = [[-1,-2], [-1,2], 
             [1,-2], [1,2], 
             [-2,-1], [-2,1], 
             [2,-1], [2,1]].freeze

    def initialize(start_pos)
      @start_node = Node.new(start_pos)
      @history = []
      create_board(start_node)
    end

    def create_board(start_node)
      create_children(start_node)
    end

    def get_moves(parent_pos)
      possible_moves = MOVES.map {|move| [parent_pos[0] + move[0], parent_pos[1] + move[1]]}
                        .select {|move| move[0].between?(0,7) && move[1].between?(0,7)}
    end

    def node_exists(pos)
      existing_move = @history.find_index {|node| node.coordinates == pos}
      return nil if existing_move.nil?
      @history[existing_move]
    end

    def create_children(start_node, child_queue=[start_node])
      return if child_queue.empty?
      @history.push(start_node)
      puts "Parent node: #{start_node.coordinates}"
      get_moves(start_node.coordinates).each do |move|
        new_child = node_exists(move)
        if new_child.nil?
          new_child = Node.new(move, start_node)
          child_queue.push(new_child)
        end
        start_node.children.push(new_child)
        p "  #{new_child.coordinates}"
      end
      create_children(child_queue.pop, child_queue)
    end
  end

  class Node
      attr_accessor :coordinates
      attr_accessor :parent
      attr_accessor :children


      def initialize(coordinates, parent=nil)
        @coordinates = coordinates
        @parent = parent
        @children = []
      end

      # def create_child(pos, history)
      #   existing_move = history.find_index({|node| node.coordinate == pos})
      #   return history[existing_move] unless existing_move.nil?
      #   child_node = nil
      #   if pos[0].between?(0,7) && pos[1].between?(0,7)
      #     child_node = Node.new(pos)
      #   end
      #   child_node
      # end

      # def create_children(parent, history, child_queue)
      #   children = []
      #   parent_pos = parent.coordinate
      #   possible_moves = MOVES.map({[parent_pos[0] + move[0], parent_pos[1] + move[1]]})
      #   possible_moves.each |move|
      #     new_child = create_child(move, history)
      #     unless new_child.nil?
      #       history.push(new_child)
      #       children.push(new_child)
      #       child_queue.push(new_child)
      #     end
      #   end
      # end
  end

  attr_accessor :board
  attr_accessor :knight

  def initialize(start_pos)
    @board = Board.new(start_pos)
  end
end

game = Knight_Travails.new([0,0])
