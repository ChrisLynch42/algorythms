class AlgorithmString < String
  def first_nonrepeated()
    string_array=self.to_s.split(//)
    character_count=Hash.new()
    return_value=nil
    string_array.each_with_index { | character_outer, index |
      if character_count[character_outer].nil?
         character_count[character_outer] = 1
      else
        character_count[character_outer] = character_count[character_outer] + 1
      end
    }
    character_count.each { | key, value |
      if value < 2
        return_value=key
      end
    }
    return_value
  end
end
