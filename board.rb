require "./node.rb"

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
    # puts "Parent node: #{start_node.coordinates}"
    get_moves(start_node.coordinates).each do |move|
      new_child = node_exists(move)
      if new_child.nil?
        new_child = Node.new(move, start_node)
        child_queue.push(new_child)
      end
      start_node.children.push(new_child)
      # p "  #{new_child.coordinates}"
    end
    create_children(child_queue.shift, child_queue)
  end
end