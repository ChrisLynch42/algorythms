class Trie
  attr_reader :root

  def initialize()
    @root = Array.new(100)
  end

  def add(new_string,marker=0)
    unless new_string.nil? || new_string.length < 1
      add_by_recursion(@root,new_string,marker)
    end
  end

  def add_suffixes(new_string,marker)
    puts 'add suffix start'
    unless new_string.nil? || new_string.length < 1
      string_end=new_string.length-1
      for counter in 0..string_end
        puts new_string[counter..string_end]
        add(new_string[counter..string_end],marker)
      end
    end
    puts 'add suffix end'
  end

  def longest_common_substring(string_zero, string_one)
    add_suffixes(string_zero,0)
    add_suffixes(string_one,1)
    longest_common_substring_by_recursion()
  end

  private
  def add_by_recursion(current_node_array,new_string,marker)
    first_char=new_string.slice!(0)
    unless first_char.nil?
      first_char_number=first_char.chr.ord
      if current_node_array[first_char_number].nil?
        current_node_array[first_char_number] = Array.new()
      end 
      add_marker(current_node_array[first_char_number],marker)   
      add_by_recursion(current_node_array[first_char_number],new_string,marker)
    else
      current_node_array[0]=1
    end
  end

  def add_marker(current_node_array,marker)
    if current_node_array[1].nil?
      current_node_array[1]=Array.new()
    end
    current_node_array[1][marker]=true
  end

  def longest_common_substring_by_recursion()
    puts 'begin'
    root_end=@root.length-1
    latest_stack=Array.new()
    for counter in 65..root_end
      unless @root[counter].nil?
        puts counter
        puts counter.chr
        puts 'markers'
        puts @root[counter][1][0]
        puts @root[counter][1][1]
        if @root[counter][1][0] && @root[counter][1][1]
          puts 'follow'
          tracking_stack=Array.new()
          tracking_stack.push(counter.chr)
          longest_common_substring_by_recursion_follow_branch(@root[counter],tracking_stack)
          if tracking_stack.length > latest_stack.length
            latest_stack = tracking_stack
          end
        end 
      end
    end
    latest_stack.join
  end

  def longest_common_substring_by_recursion_follow_branch(current_node_array,tracking_stack)
    array_end=current_node_array.length-1
    for counter in 65..array_end
      unless current_node_array[counter].nil?
        if current_node_array[counter][1][0] && current_node_array[counter][1][1]
          tracking_stack.push(counter.chr)
          longest_common_substring_by_recursion_follow_branch(current_node_array[counter],tracking_stack)
        end 
      end
    end
  end

end
