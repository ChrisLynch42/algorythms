require 'single_linked_list_element'

class SingleLinkedList
  attr_reader :head

  def push(element)
    unless element.nil?
      if @head.nil?
        @head=element
      else
        element.next_node=@head
        @head=element
      end
    end
  end

  def pop()
    element=@head
    @head=@head.next_node
    element
  end
  
end
