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
    @last = @head
    last_by_recursion(@head)
    @last
  end        

  private
    def last_by_recursion(element)
      unless element.nil?
        @last = element
        last_by_recursion(element.next_node)
      end
    end

end
