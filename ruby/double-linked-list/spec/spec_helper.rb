$LOAD_PATH.unshift File.expand_path('lib')

require 'double_linked_list'
require 'double_linked_list_element'



def add_elements(the_list)
  the_list.add(DoubleLinkedListElement.new("one"))
  the_list.add(DoubleLinkedListElement.new("two"))
  the_list.add(DoubleLinkedListElement.new("three"))
  the_list.add(DoubleLinkedListElement.new("four"))
end
