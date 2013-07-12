require 'single_linked_list_element'

class SingleLinkedList
  attr_reader :head, :current, :tail

  def initialize
  end

  def add(element)
    if @head.nil?
      @head=element
      @tail=element
      @current=element
    else
      @tail.next_node=element
      @tail=element
    end
  end

  def next
    unless @current.nil?
      return_value = @current
      @current = @current.next_node
    end
    if block_given?
      yield return_value
    end
    return_value
  end

end
