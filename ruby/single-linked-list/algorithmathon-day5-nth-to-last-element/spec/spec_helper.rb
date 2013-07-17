$LOAD_PATH.unshift File.expand_path('lib')

require 'single_linked_list'
require 'single_linked_list_element'



def add_elements(the_list)
  the_list.add(SingleLinkedListElement.new('one'))
  the_list.add(SingleLinkedListElement.new('two'))
  the_list.add(SingleLinkedListElement.new('three'))
  the_list.add(SingleLinkedListElement.new('four'))
end
