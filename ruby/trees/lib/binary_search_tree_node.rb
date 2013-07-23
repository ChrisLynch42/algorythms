class BinarySearchTreeNode
  attr_accessor :lesser, :greater
  attr_reader :data

  def initialize(data,lesser=nil,greater=nil)
    @data=data
    self.lesser=lesser
    self.greater=greater
    if (!self.lesser.nil? && self.greater.nil?) || (!self.lesser.nil? && (self.lesser.data > self.greater.data))
      throw "The lesser exceeds the greater"
    end
   
    if !self.lesser.nil? && !self.data.nil? && self.lesser.data == self.data
      throw "The lesser is equal to the parent"
    end
    
    if !self.greater.nil? && !self.data.nil? && self.greater.data == self.data
      throw "The greater is equal to the parent"
    end    
    
    if !self.lesser.nil? && !self.greater.nil? && self.lesser.data == self.greater.data
      throw "The lesser is equal to the parent"
    end
  end

  def less_than?(target_node)
    if target_node.nil?
      raise "The target_node is nil!"
    else
      if @data < target_node.data
        true
      else
        false
      end
    end
  end

  def greater_than?(target_node)
    if target_node.nil?
      raise "The target_node is nil!"
    else
      if @data > target_node.data
        true
      else
        false
      end
    end
  end 


end
