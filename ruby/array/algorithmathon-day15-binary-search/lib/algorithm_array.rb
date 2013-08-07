class AlgorithmArray < Array
  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located.             
  def new_find(search_object,start_location=nil)
    if start_location.nil?
      start_location=self.length/2
    end
    new_find_by_recursion(search_object,start_location,self.length-1,0)
  end

  private

  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located or nil if it is not found.               
  def new_find_by_recursion(search_object,search_location,high,low)
    if search_location >= self.length || search_location < 0 || high == low
      return
    end
    if self[search_location] < search_object
      low = search_location
      next_location = high - ((high - low)/2)
      new_find_by_recursion(search_object,next_location,high,low)
    elsif self[search_location] > search_object
      high = search_location
      next_location = low + ((high - low)/2)      
      new_find_by_recursion(search_object,next_location,high,low)
    else
      return_value = search_location
    end
  end

end
