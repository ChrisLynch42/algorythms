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
    last_by_recursion(@head)
  end        

  private
    def last_by_recursion(element)
      unless element.nil?
        unless element.next_node.nil?
          last_by_recursion(element.next_node)
        else
          element
        end
      end
    end
end
