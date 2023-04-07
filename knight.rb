#Author: Murgray D. John
#Date: 4/7/2023
#Purpose: Shows the shortest way for a knight to get from one square to another.

require "./board.rb"

class Knight
  attr_accessor :board
  attr_accessor :knight

  def initialize(start_pos, end_pos)
    @board = Board.new(start_pos)
    @knight = []
    knight_moves(start_pos, end_pos)
  end

  def knight_moves(start_pos, end_pos)
    bfs(start_pos, end_pos)
    knight.each {|move| print "#{move.coordinates}\n"}
  end

  def bfs(start_pos, end_pos)
    move_queue = [@board.start_node]
    curr_node = move_queue.shift
    until curr_node.coordinates == end_pos
      curr_node.children.each {|child| move_queue.push(child)}
      curr_node = move_queue.shift
    end
    knight.unshift(curr_node)
    until curr_node.coordinates == start_pos
      curr_node = curr_node.parent
      knight.unshift(curr_node)
    end
  end
end

game = Knight.new([3,3], [4,3])
