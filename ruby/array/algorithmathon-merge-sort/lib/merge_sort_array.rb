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
    break_array_apart_then_merge(self)
  end

  def break_array_apart_then_merge(local_array)
    return_array = local_array
    if local_array.length > 1
      split_index = local_array.length / 2
      array_of_arrays = local_array.each_slice(split_index).to_a
      return_array = merge_arrays(break_array_apart_then_merge(array_of_arrays[0]), break_array_apart_then_merge(array_of_arrays[1]))
    end
    return_array
  end

  def merge_arrays(array_one, array_two)
    return_array = []
    index = 0
    while array_one.length > 0 || array_two.length > 0
      if array_one.length > 0 && array_two.length > 0
        if array_one[index] > array_two[index]
          add_to_array(return_array, array_two.shift,array_one.shift)
        else
          add_to_array(return_array, array_one.shift,array_two.shift)
        end
      else
        if array_one.length > 0
          add_array_to_array(return_array,array_one)
        end
        if array_two.length > 0
          add_array_to_array(return_array,array_two)
        end
      end
    end
    return_array
  end

  def add_to_array(target_array,value_one, value_two)
    target_array[target_array.length] = value_one
    target_array[target_array.length] = value_two
  end

  def add_array_to_array(target_array,source_array)
    while source_array.length > 0
      target_array[target_array.length] = source_array.shift
    end
  end


end
