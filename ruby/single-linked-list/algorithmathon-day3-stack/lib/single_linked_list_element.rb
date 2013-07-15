class SingleLinkedListElement
  attr_accessor :next_node, :data

  def initialize(data=nil,next_node=nil)
    self.data=data
    self.next_node=next_node
  end
end
