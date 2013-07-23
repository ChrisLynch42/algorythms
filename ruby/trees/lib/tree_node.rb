class TreeNode
  attr_accessor :children, :data

  def initialize(data=nil,children=nil)
    self.data=data
    if children.nil?
      self.children=Hash.new()
    else
      self.children=children
    end
  end
end
