class AlgorithmString < String
  attr_reader :iteration_count

  #Determine all possible orderings of characters in a string
  #
  #  - returns an array with all the possible orderings.
  def permutate()
    @iteration_count=0
    return_array = Array.new()
    permutate_by_recursion(return_array,Array.new(),Array.new(),0)
    return_array
  end

  def permutate2()
    @iteration_count=0    
    return_array = Array.new()
    string_array = self.split('')
    permutate_by_recursion2(return_array,string_array,0)
    return_array
  end

  def permutate3()
    @iteration_count=0    
    return_array = Array.new()
    string_array = self.split('')
    permutate_by_recursion3(return_array,string_array,"")
    return_array
  end  

  def permutate4()
    @iteration_count=0    
    return_array = Array.new()
    string_array = self.split('')
    permutate_by_recursion4(return_array,string_array,"",0)
    return_array
  end  

  private
  def permutate_by_recursion(return_array,build_array,tracking_array, current_position)
    final_position= self.length - 1

    if current_position > final_position
      return_array[return_array.length]=build_array.join()
      return
    end
    
    for i in 0..final_position
      @iteration_count = @iteration_count + 1
      unless tracking_array[i]
        build_array.push(self[i])
        tracking_array[i]=true
        permutate_by_recursion(return_array,build_array,tracking_array,current_position + 1)
        build_array.pop()
        tracking_array[i]=false
      end
    end
  end

  def permutate_by_recursion2(return_array, string_array, current_position)
    final_position= self.length - 1

    if current_position > final_position
      return_array[return_array.length]=string_array.join()
      return
    end
    
    for i in current_position..final_position
      @iteration_count = @iteration_count + 1
      switch_character(string_array,current_position,i)
      permutate_by_recursion2(return_array,string_array,current_position + 1)
      switch_character(string_array,current_position,i)
    end
  end  

  def switch_character(string_array,first,second)    
    value_holder=string_array[second]
    string_array[second]=string_array[first]
    string_array[first]=value_holder
  end

  def permutate_by_recursion3(return_array, string_array, string_value)
    if string_array.nil?  || string_array.length < 1
      return_array[return_array.length]=string_value
      return
    end
    string_array.each_with_index { | value, index |
      @iteration_count = @iteration_count + 1
      prefix = string_value + value
      temp_array = string_array.clone()
      temp_array.delete_at(index)
      permutate_by_recursion3(return_array, temp_array, prefix)
    }

  end 

  def permutate_by_recursion4(return_array, string_array, string_value,current_level)
    if string_array.nil?  || string_array.length < 1
      return_array[return_array.length]=string_value
      return
    end
    string_array.each_with_index { | value, index |
      @iteration_count = @iteration_count + 1
      prefix = string_value + value
      temp_array = string_array.clone()
      temp_array.delete_at(index)
      permutate_by_recursion4(return_array, temp_array, prefix, current_level + 1)
    }

  end  
  
end
