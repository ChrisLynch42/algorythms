class AlgorithmString < String


  #Determine all possible orderings of characters in a string
  #
  #  - returns an array with all the possible orderings.
  def permutate()   
    start_pos = 0
    end_pos=self.length - 1
    return_array = Array.new()
    return_array[return_array.length]=self[start_pos..end_pos]
    permutate_by_recursion(return_array,self[0] , self[1..end_pos])
    permutate_by_recursion(return_array,"" , self[start_pos..end_pos])    
    puts return_array
    return_array
  end

  private
    def permutate_by_recursion(return_array, prefix, suffix)      
      puts 'prefix = ' + prefix
      puts 'suffix=' + suffix
      if suffix.nil? || suffix.length < 1
        return
      end
      end_pos = suffix.length - 1
      i=1
      suffix_copy = suffix[0..end_pos]
      while i < suffix.length
        suffix_copy = suffix[0..end_pos]
        character_holder = suffix_copy[0]                
        suffix_copy[0]=suffix_copy[i]
        suffix_copy[i]=character_holder
        permutate_by_recursion(return_array, prefix + suffix_copy[0], suffix_copy[1..end_pos])
        return_array[return_array.length]=prefix+suffix_copy

        puts 'after=' + suffix_copy
        
        i=i+1
      end      
    end
end
