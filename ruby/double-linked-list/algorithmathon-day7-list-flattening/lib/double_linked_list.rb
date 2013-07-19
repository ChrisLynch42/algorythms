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

  def flatten!()
    flatten_by_recursion(@head)
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

    def recount_by_recursion(element)
      unless element.nil?
        @length = @length + 1
        recount_by_recursion(element.next_node)
      end
    end

    def flatten_by_recursion(element)
      unless element.nil?
        if element.child.nil?
          flatten_by_recursion(element.next_node)
        else
          tail = element.child.last()
          head = element.child.element_at(0)
          next_node = element.next_node
          element.next_node=head
          tail.next_node=next_node
          @length = @length + element.child.length()
          element.child=nil
          flatten_by_recursion(tail.next_node)
        end
      end
    end

end
