$LOAD_PATH.unshift File.expand_path('lib')

require 'double_linked_list'
require 'double_linked_list_element'



def add_elements(the_list)
  the_list.add(DoubleLinkedListElement.new("one"))
  the_list.add(DoubleLinkedListElement.new("two"))
  the_list.add(DoubleLinkedListElement.new("three"))
  the_list.add(DoubleLinkedListElement.new("four"))
end

def build_list(number_list)
  the_list=DoubleLinkedList.new()
  number_list.each { | the_number |
    the_list.add(DoubleLinkedListElement.new(the_number.to_s))
  }
  the_list
end

def build_master_list()
  the_list=build_list((1..12))
  the_list.element_at(0).child=build_list(13..18)
  the_list.element_at(4).child=build_list(19..26)
  the_list.element_at(11).child=build_list(27..42)
  the_list
end
