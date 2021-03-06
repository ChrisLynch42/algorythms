class AlgorithmString < String


  #Remove all characters from string
  #
  #+character_array+:: An array of characters to be removed from the string.
  def new_remove(character_array)
    unless character_array.nil? || !character_array.class.name.eql?('Array')
      return_io=StringIO.new()      
      self.each_char { | char |
        unless character_array.include?(char)
          return_io.putc char
        end
      }
      return_value = return_io.string
    end
    return_value
  end

  #Reverses the order of the characters in the string
  def new_reverse!()
    unless self.length < 1    
      reverse_by_recursion(0)
    end
  end


  #this method will return the integer value of the current
  #string or throw and "Invalid integer format" exception
  def string_to_integer
    power_counter = self.length - 1
    return_value=0
    is_negative=false
    self.each_char { | character_number |
      if character_number == "-"
        is_negative=true
      else
        character_value = character_number.chr.ord
        character_value = character_value - 48
        if character_value > -1 && character_value < 10
          return_value = return_value + (character_value * (10 ** power_counter))
        else
          raise "Invalid integer format"
        end
      end
      power_counter = power_counter - 1  
    }
    if is_negative
      return_value = return_value * -1
    end
    return_value
  end


  #Converts and integer to a string
  #
  #+integer_value+:: An integer
  def integer_to_string(integer_value)
    return_value=""
    prefix = ''
    if integer_value < 0
     prefix="-"
     integer_value = integer_value * -1
    end
    while integer_value > 0
      return_value = ((integer_value % 10) + 48).chr + return_value
      integer_value = integer_value / 10
    end
    prefix + return_value
  end

  private
  
  #helper method to new_reverse!() counts the number of 
  #recursions.  Switches characters from the end to the front
  #working from the ends to the middle.
  #
  #+counter+:: Tracks the distance from the ends. 
  def reverse_by_recursion(counter)
    unless counter >= (self.length / 2)
      holder=self[counter]
      self[counter]=self[self.length - 1 - counter]
      self[self.length - (1 + counter)]=holder
      counter = counter + 1
      reverse_by_recursion(counter)
    end
    self
  end

end
