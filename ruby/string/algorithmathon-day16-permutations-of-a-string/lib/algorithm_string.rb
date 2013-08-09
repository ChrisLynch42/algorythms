class AlgorithmString < String


  #Determine all possible orderings of characters in a string
  #
  #  - returns an array with all the possible orderings.
  def permutate()
    @nomore=0
    return_array = Array.new()
    permutate_by_recursion(return_array,Array.new(),Array.new(),0)
    puts return_array
    return_array
  end

  private
  def permutate_by_recursion(return_array,build_array,tracking_array, current_position)
    final_position= self.length - 1

    if current_position > final_position
      puts 'end'
      puts build_array.join()
      return_array[return_array.length]=build_array.join()
      return
    end
    
    for i in 0..(self.length-1)
      puts "i=#{i}"
      @nomore = @nomore + 1
      puts "nomore=#{@nomore}"
      unless tracking_array[i]
        build_array.push(self[i])
        puts build_array.join()
        tracking_array[i]=true
        permutate_by_recursion(return_array,build_array,tracking_array,current_position + 1)
        build_array.pop()
        tracking_array[i]=false
      end
    end
  end

  def switch_characters(string_array,position_one,position_two)
    character_holder=string_array[position_one]
    string_array[position_one]=string_array[position_two]
    string_array[position_two]=character_holder
  end
end
