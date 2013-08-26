class TelephoneWords < Array
  
  def initialize()
    @number_dictionary = { 0=> [], 1 => [], 2 => ['A','B','C'], 3 => ['D','E','F'], 4 => ['G','H','I'], 5 => ['J','K','L'], 6 => ['M','N','O'], 7 => ['P','Q','R','S'], 8 => ['T','U','V'], 9 => ['W','X','Y','Z'] }
  end


  #Find all possible letter combinations from a telephone number.
  #
  #* *Args*    :
  #  - +telephone_number+ -> The telephone number to be analyzed.
  #* *Returns* :
  #  - An array containing strings representing all the possible letter combinations.
  def build_words(telephone_number)
    if telephone_number.nil? || telephone_number.length < 1
      return
    end
    return_results = Array.new()
    build_words_by_recursion(telephone_number,Array.new(),return_results,0)
    return return_results
  end

  private
    
  #Find all possible letter combinations from a telephone number by recursing
  #through the possible letter combinations.
  #
  #* *Args*    :
  #  - +telephone_number+ -> The telephone number to be analyzed.
  #  - +current_word+ -> The combinations of letters currently being put together to build a word.
  #  - +return_results+ -> An array used to store the combinations of letters
  #  - +depth+ -> Tracks which telephone number is currently being examined.
  #* *Returns* :
  #  - An array containing strings representing all the possible letter combinations.
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
