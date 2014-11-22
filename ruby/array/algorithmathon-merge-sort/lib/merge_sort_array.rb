class MergeSortArray < Array
  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located.             
  def new_find(object_to_find)
    merge_sort()
    self.find_index(object_to_find)
  end

  #Sort this array using a merge sort.
  #
  #* *Args*    :
  #  - none
  #* *Returns* :
  #  - this array.
  def merge_sort()

  end

  def break_array_apart_then_merge(local_array)
    if local_array.length > 1
      split_index = local_array / 2
      break_array_apart_then_merge(local_array.shift(split_index))
      break_array_apart_then_merge(local_array)
    end
  end




  def sort_arrays_by_size_then_merge(array_one, array_two)
    if array_one.length > array_two.length
      merge_arrays(array_one,array_two)
    else
      merge_arrays(array_two,array_one)
    end
  end

  def merge_arrays(array_one, array_two)
    end_index = array_one.length - 1
    for i in 0..end_index
      if array_two.length > index
        if array_one[index] > array_two[index]
          return_array[return_index] = array_two[index]
          return_index = return_index + 1
          return_array[return_index] = array_two_value


          array_one.insert(index,array_two_value)
          array_two_value = array_two.shift
        end
        puts "return_array #{return_array.to_s}"
      else
        return_array[index] = array_one[index]
      end
    end
    return_array
  end

  def insert_into_array(the_array,index,value)
    the
  end

end
