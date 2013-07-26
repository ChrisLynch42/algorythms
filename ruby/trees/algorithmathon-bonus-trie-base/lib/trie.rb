class Trie
  attr_reader :root

  def initialize()
    @root = Array.new(27)
  end

  def add(new_string)
    unless new_string.nil? || new_string.length < 1
      add_by_recursion(@root,new_string)
    end
  end

  private
  def add_by_recursion(current_node_array,new_string)
    first_char=new_string.slice!(0)
    unless first_char.nil?
      first_char_number=first_char.chr.ord
      if current_node_array[first_char_number].nil?
        current_node_array[first_char_number] = Array.new()
      end    
      add_by_recursion(current_node_array[first_char_number],new_string)
    else
      current_node_array[0]=1
    end
  end

end
