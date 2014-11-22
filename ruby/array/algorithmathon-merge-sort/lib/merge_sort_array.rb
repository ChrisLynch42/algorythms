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
    return_array = []
    index = 0
    while array_one.length > 0 || array_two.length > 0
      if array_one.length > 0 && array_two.length > 0
        puts "array one #{array_one[index]}"
        puts "array two #{array_two[index]}"
        if array_one[index] > array_two[index]
          add_to_array(return_array, array_two.shift,array_one.shift)
        else
          add_to_array(return_array, array_one.shift,array_two.shift)
        end
      else
        if array_one.length > 0
          puts "array one #{array_one[index]}"
          add_array_to_array(return_array,array_one)
        end
        if array_two.length > 0
          puts "array two #{array_one[index]}"
          add_array_to_array(return_array,array_two)
        end
      end
    end
    return_array
  end

  def add_to_array(target_array,value_one, value_two)
    target_array[target_array.length] = value_one
    target_array[target_array.length] = value_two
    puts "target_array #{target_array.to_s}"
  end

  def add_array_to_array(target_array,source_array)
    while source_array.length > 0
      target_array[target_array.length] = source_array.shift
    end
  end


end
