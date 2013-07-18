class DoubleLinkedListElement
  attr_accessor :next_node, :prev_node, :data

  def initialize(data=nil,next_node=nil,prev_node=nil)
    self.data=data
    self.next_node=next_node
    self.prev_node=prev_node
  end
end
