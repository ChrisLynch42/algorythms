class AlgorithmString < String


  #Determine all possible orderings of characters in a string
  #
  #  - returns an array with all the possible orderings.
  def permutate()   
    return_array = Array.new()
    permutate_by_recursion(return_array,self,0,0,self.length-1)    
    puts return_array
    return_array
  end

  private
    def permutate_by_recursion(return_array, target, current_position, start_position,end_position)
      print "current_position="
      puts current_position
      if current_position >= end_position
        return
      end
      for i in start_position..end_position
        switch_characters(target,current_position,i)        
        puts target
        return_array[return_array.length]=target[0..end_position]
        permutate_by_recursion(return_array, target, current_position + 1, current_position + 1, end_position)
        switch_characters(target,current_position,i)
      end
    end

    def switch_characters(target,position_one,position_two)
      character_holder=target[position_one]
      target[position_one]=target[position_two]
      target[position_two]=character_holder
    end


end
