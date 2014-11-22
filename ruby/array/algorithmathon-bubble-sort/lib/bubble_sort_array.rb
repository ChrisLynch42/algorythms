class BubbleSortArray < Array
  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located.             
  def new_find(object_to_find)
    bubble_sort()
    self.find_index(object_to_find)
  end

  private

  #Sort this array using a bubble sort.
  #
  #* *Args*    :
  #  - none
  #* *Returns* :
  #  - this array.
  def bubble_sort()
    end_index = self.length - 1
    swap_occured = 1 == 2
    while swap_occured
      swap_occured = false
      for index in 1..end_index
        if self[index - 1] > self[index]
          temporarily_hold_value = self[index]
          self[index] = self[index - 1]
          self[index - 1]=temporarily_hold_value
          swap_occured = true
        end
      end
    end
    self
  end

end
