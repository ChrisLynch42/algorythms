require 'double_linked_list_element'

class DoubleLinkedList
  attr_reader :head, :tail, :length

  def initialize()
    @length=0
  end

  def add(element)
    if @head.nil?
      @head = element
      @tail = element
      @length=1
    else
      @tail.next_node=element
      element.prev_node=@tail
      @tail=element
      @length = @length + 1
    end
  end

  def last()
    @tail
  end 

  def length()
    @length
  end

  def element_at(position_count)
    if position_count >= 0
      retrieve_forward_by_recursion(@head,position_count,0)
    end
  end

  private
    def retrieve_forward_by_recursion(element,position_count,current_count)
      unless element.nil?
        if current_count == position_count
          element
        else
          current_count=current_count + 1
          retrieve_forward_by_recursion(element.next_node,position_count,current_count)
        end
      end
    end

end
