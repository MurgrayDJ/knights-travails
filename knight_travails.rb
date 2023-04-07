#Author: Murgray D. John
#Date: 4/7/2023
#Purpose: Shows the shortest way for a knight to get from one square to another.

require "./board.rb"

class Knight_Travails
  attr_accessor :board
  attr_accessor :knight

  def initialize(start_pos)
    @board = Board.new(start_pos)
  end
end

game = Knight_Travails.new([0,0])
