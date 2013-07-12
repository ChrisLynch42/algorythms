require 'single_linked_list_element'

class SingleLinkedList
  attr_reader :length, :head, :tail, :current

  def initialize
    @length=0
  end

  def add(data)
    element = SingleLinkedListElement.new()
    element.data=data
    if @head.nil?
      @head=element
      @tail=element
      @current=element
    else
      @tail.next=element
      @tail=element
    end
    @length=@length+1
  end

  def next
    unless @current.nil?
      data = @current.data
      @current = @current.next
    end
    if block_given?
      yield data
    end
    data
  end

#  didn't use recursion but was fewer lines of code
#  def list
#    last = @current
#    @current = @head
#    return_value = Array.new()
#    while return_value.length < @length
#      self.next {|data|
#        return_value.push(data)
#      }
#    end
#    @current = last
#    return_value
#  end


  def list
    last = @current
    @current = @head
    return_value = Array.new()
    forward_by_recursion(return_value)
    @current = last
    return_value
  end
  

  def list_reverse
    last = @current
    @current = @head
    return_value = Array.new()
    reverse_by_recursion(return_value)
    @current = last
    return_value
  end

  private
    def reverse_by_recursion(values)
      local_element = self.next 
      unless local_element.nil?
        reverse_by_recursion(values)
        values.push(local_element)
      end
    end

    def forward_by_recursion(values)
      local_element = self.next 
      unless local_element.nil?
        values.push(local_element)
        reverse_by_recursion(values)
      end
    end


end
