class TelephoneWords < Array
  #Find the location of the matching element in the array.
  #
  #* *Args*    :
  #+search_object+:: The object being looked for.
  #* *Returns* :
  #  - an integer representing the location in the array the matching element is located. 
  
  def initialize()
    @number_dictionary = { 0=> [], 1 => [], 2 => ['A','B','C'], 3 => ['D','E','F'], 4 => ['G','H','I'], 5 => ['J','K','L'], 6 => ['M','N','O'], 7 => ['P','Q','R','S'], 8 => ['T','U','V'], 9 => ['W','X','Y','Z'] }
  end
    
  def build_words(telephone_number)
    if telephone_number.nil? || telephone_number.length < 1
      return
    end
    return_results = Array.new()
    build_words_by_recursion(telephone_number,Array.new(),return_results,0)
    return return_results
  end

  private

    def build_words_by_recursion(telephone_number,current_word,return_results,depth)
      if depth > (telephone_number.length - 1)
        return_results[return_results.length]=current_word.join()
      end
      unless telephone_number[depth].nil?
        if telephone_number[depth] == 0 || telephone_number[depth] == 1
          current_word.push(telephone_number[depth].to_s)
          build_words_by_recursion(telephone_number,current_word,return_results,depth + 1)
          current_word.pop()
        else
          @number_dictionary[telephone_number[depth]].each { | letter |
            current_word.push(letter)
            build_words_by_recursion(telephone_number, current_word, return_results, depth + 1)
            current_word.pop()
          }          
        end
      end
     
    end


end
