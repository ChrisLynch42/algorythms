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

  def length()
    length_by_recursion(@head,0)
  end  

  def retrieve(position_count)
    if position_count == 0
      nil
    end
    if position_count > 0
      retrieve_forward_by_recursion(@head,position_count,0)
    else
      count = length()
      count = count + position_count + 1
      retrieve_forward_by_recursion(@head,count,0)
    end
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

    def length_by_recursion(element,count)
      unless element.nil?
        count = count + 1
        length_by_recursion(element.next_node,count)
      else
        count
      end
    end    

    def retrieve_forward_by_recursion(element,position_count,current_count)
      unless element.nil?
        current_count=current_count + 1
        if current_count == position_count
          puts element.data
          element
        else
          retrieve_forward_by_recursion(element.next_node,position_count,current_count)
        end
      end
    end
end
