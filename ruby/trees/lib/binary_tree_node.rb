class BinaryTreeNode
  attr_accessor :left, :right, :data

  def initialize(data=nil,left=nil,right=nil)
    self.data=data
    self.left=left
    self.right=right
  end
end
