class DoubleLinkedListElement
  attr_accessor :next_node, :prev_node, :child, :data

  def initialize(data=nil,next_node=nil,prev_node=nil,child=nil)
    self.data=data
    self.next_node=next_node
    self.prev_node=prev_node
    self.child=child
  end
end
