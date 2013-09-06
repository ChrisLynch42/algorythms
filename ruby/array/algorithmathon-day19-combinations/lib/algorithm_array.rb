class AlgorithmArray < Array
  attr_reader :iteration_count


  def combinations(combination_length)
    @iteration_count=0
    @level=0
    unless combination_length.nil? || combination_length < 1
      positions = combination_length - 1
      return_array = Array.new()
      build_array = self[0..positions]
      return_array[return_array.length]= build_array.join()
      build_array.pop()
      positions.downto(0) do | position |
        combinate_by_recursion(return_array,build_array,positions,position,position+1)
        @level = @level - 1
        build_array.pop()
      end
      return_array
    end
  end

  def combinate_by_recursion(return_array,build_array,positions,current_position,end_position)
    @level = @level + 1
    if positions < current_position
      return_array[return_array.length]= build_array.join()
      return
    end

    while end_position < self.length
      @iteration_count = @iteration_count + 1
      build_array.push(self[end_position])
      combinate_by_recursion(return_array,build_array,positions,current_position + 1,end_position + 1)
      @level = @level - 1
      build_array.pop()
      end_position=end_position+1
    end
  end  


end
