class Node
  attr_accessor :coordinates
  attr_accessor :parent
  attr_accessor :children


  def initialize(coordinates, parent=nil)
    @coordinates = coordinates
    @parent = parent
    @children = []
  end
end