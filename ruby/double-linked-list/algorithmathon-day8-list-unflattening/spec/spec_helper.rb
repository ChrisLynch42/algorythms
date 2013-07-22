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
  first_child_list=build_list(13..18)
  second_child_list=build_list(19..26)
  first_child_list.last().child=second_child_list
  the_list.element_at(0).child=first_child_list

  first_child_list=build_list(27..34)
  second_child_list=build_list(35..42)
  first_child_list.element_at(2).child=second_child_list
  the_list.element_at(4).child=first_child_list


  first_child_list=build_list(43..45)
  second_child_list=build_list(46..51)
  first_child_list.element_at(0).child=second_child_list  
  the_list.element_at(11).child=first_child_list
  the_list
end
