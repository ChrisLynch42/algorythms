require 'single_linked_list_element'

class SingleLinkedList
  attr_reader :head

  def add(element)
    if @head.nil?
      @head = element
    else
      last_element=last()
      last_element.next_node=element
    end
  end

  def last()
    last_element=SingleLinkedListElement.new()
    last_by_recursion(@head,last_element)
    last_element.next_node
  end        

  private
    def last_by_recursion(element,last_element)
      unless element.nil?
        last_element.next_node=element
        unless element.next_node.nil?
          last_by_recursion(element.next_node,last_element)
        end
      end
    end
end
