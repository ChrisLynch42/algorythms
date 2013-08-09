class AlgorithmString < String


  #Determine all possible orderings of characters in a string
  #
  #  - returns an array with all the possible orderings.
  def permutate()
    return_array = Array.new()
    permutate_by_recursion(return_array,Array.new(),Array.new(),0)
    return_array
  end

  def permutate2()
    puts 'begin'
    @nomore=0
    return_array = Array.new()
    string_array = self.split('')
    permutate_by_recursion2(return_array,string_array,0)
    puts return_array
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
       @nomore = @nomore + 1
       puts @nomore
        puts string_array.join()
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
end
