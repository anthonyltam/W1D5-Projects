require_relative "skeleton/lib/00_tree_node"

class KnightPathFinder
  
  DIFF = [
    [1,2],
    [1,-2],
    
    [2,1],
    [2,-1],
    
    [-1,-2],
    [-1,2],
    
    [-2,1],
    [-2,-1]
  ]
  
  attr_accessor :root_node
  
  def initialize(pos = [0, 0])
    @root_node = PolyTreeNode.new(pos)
    @visited_pos = [pos]
  end
  
  def self.valid_moves(pos)
    # @visited_pos << pos unless @visited_pos.include?(pos)
    moves = possible_paths(pos)
  end
  
  
  def possible_paths(pos)
    # WERE PASSED THE POS OF THE KNIGHT RIGHT NOW
    # RETURN MOVES THAT CAN BE MADE ([+- 1, +- 2])
    paths = []
    
    DIFF.each do |path|
      move = [path[0] + pos[0], path[1], pos[1]] 
      paths << move if (move[0] < 8 && move[0] >= 0) & (move[1] < 8 && move[1] >= 0)   
    end 
    
    paths.reject do |move| 
      visited_pos.include?(move)
    end
  end
  
  
  #
end