class PolyTreeNode
  
  attr_reader :value, :children, :parent
  
  def initialize(value, children = [], parent = nil)
    @value, @children, @parent = value, children, parent
  end
  
  def parent=(node)
    unless @parent.nil?
      @parent.children.delete(self)
    end 
    @parent = node
    if @parent
      @parent.children << self unless @parent.children.include?(self)
    end 

    
    
  end
  
  def add_child(node)
    node.parent = self
  end
  
  def remove_child(node)
    raise "Not a child" unless self.children.include?(node)
      
    node.parent = nil
  end
  
  
  def dfs(target)

    if self.value == target
      return self 
    end
    self.children.each do |child|
      res = child.dfs(target) 
      return res unless res.nil?
    end
    nil
  end
  
def bfs(target)
  
  the_queue = [self]
  # while !the_queue.empty?
  until the_queue.empty?
    node = the_queue.shift    
    if node.value == target 
      return node 
    end 
    node.children.each do |child|
      the_queue.push(child) 
    end  
  end 
  nil 
  
end 
# 
# def inspect
#   puts "value: #{self.value}, children: #{self.children}, parents: #{self.parent.value}"
# end


end




#