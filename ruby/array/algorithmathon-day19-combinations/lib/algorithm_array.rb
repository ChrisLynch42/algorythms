class AlgorithmArray < Array
  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located.             
  def combinations(combination_length)
    unless combination_length.nil? || combination_length < 1
      return_array = Array.new()
      combinations_by_recursion(return_array,combination_length-2,0,combination_length-1)
      return_array
    end
  end


  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #+search_location+:: The location in the array to compare values.
  #+high+:: Tracks the lowest location in the array that is know to contain a value greater than the search_object.
  #+high+:: Tracks the highest location in the array that is know to contain a value less than the search_object.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located or nil if it is not found.               
  def combinations_by_recursion(return_array,prefix_length,start_position,end_position)
    if start_position > (self.length - 1) 

      return
    end
    current_position=start_position
    current_array = Array.new()
    for current_count in 0..prefix_length
      current_array[current_count]=self[current_position]
      current_position=get_next_position(current_position)
    end
    current_array[current_array.length]=self[end_position]
    return_array[return_array.length]=current_array.to_s
    end_position=get_next_position(end_position)
    if (start_position - 1) <= end_position
      start_position=start_position + 1
      end_position=get_next_position(start_position + prefix_length)
    end
    combinations_by_recursion(return_array,prefix_length,start_position,end_position)
  end

  def get_next_position(current_position)
    if current_position >= (self.length - 1)
      current_position = 0
    else
      current_position = current_position + 1
    end    
  end

end
