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

  def remove(element)
    remove_by_recursion(@head,element,nil)
  end

  def last()
    last_element=SingleLinkedListElement.new()
    last_by_recursion(@head,last_element)
    last_element.next_node
  end        

  def length()
    length_by_recursion(@head,0)
  end  

  def insert_after(target_element, new_element)
    if new_element.nil?
      new_element
    else
      insert_after_by_recursion(@head, target_element, new_element)
    end
  end

  def insert_before(target_element, new_element)
    if new_element.nil?
      new_element
    else
      insert_before_by_recursion(@head, target_element, new_element, nil)
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

  def remove_by_recursion(element,match_element,previous_element)
    if element.nil?
      element
    else
      if element.eql?(match_element)
        if previous_element.nil?
          @head=element.next_node
        else
          previous_element.next_node=element.next_node
        end
        element
      else
        remove_by_recursion(element.next_node,match_element,element)
      end
    end
  end 

  def insert_after_by_recursion(current_element,target_element,new_element)
    if current_element.nil?
      current_element
    else
      if current_element.eql?(target_element)
        new_element.next_node=current_element.next_node
        current_element.next_node=new_element
        current_element
      else
        insert_after_by_recursion(current_element.next_node,target_element,new_element)
      end
    end
  end 

  def insert_before_by_recursion(current_element,target_element,new_element,previous_element)
    if current_element.nil?
      current_element
    else
      if current_element.eql?(target_element)
        new_element.next_node=current_element
        if previous_element.nil?
          @head = new_element
        else
          previous_element.next_node=new_element
        end
        new_element
      else
        insert_before_by_recursion(current_element.next_node,target_element,new_element,current_element)
      end
    end
  end 
end
