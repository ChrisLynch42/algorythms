require 'spec_helper'
require 'single_linked_list_spec_helper'

describe SingleLinkedList do

  describe "Class" do
    it "should have method 'last'" do
      SingleLinkedList.method_defined?(:last).should be_true
    end

    it "should have method 'add'" do
      SingleLinkedList.method_defined?(:add).should be_true
    end

    it "should have method 'remove'" do
      SingleLinkedList.method_defined?(:remove).should be_true
    end
  end

  describe "Instance" do

    before(:each) do
      @list = SingleLinkedList.new()
    end

    it "should return nil when 'last()' is called" do
      @list.last().should be_nil
    end

    it "should not return nil when 'last()' is called" do
      add_elements(@list)
      @list.last().should_not be_nil
    end
    
    it "should return 'four' when 'last().data' is called" do
      add_elements(@list)
      @list.last().data.should == "four"
    end    

     it "should return removed object  when 'remove' is called" do
      first = SingleLinkedListElement.new("first")
      @list.add(first)
      @list.remove(first).eql?(first).should be_true
    end  

     it "should return removed object  when 'remove' is called and object is the head among many" do
      first = SingleLinkedListElement.new("first")
      @list.add(first)
      add_elements(@list)
      @list.length().should == 5
      @list.remove(first).eql?(first).should be_true
      @list.length().should == 4
    end  

    it "should return removed object  when 'remove' is called and object is the last among many" do
      last = SingleLinkedListElement.new("last")
      add_elements(@list)
      @list.add(last)
      @list.length().should == 5
      @list.remove(last).eql?(last).should be_true
      @list.length().should == 4
    end  

    it "should return removed object  when 'remove' is called and object is the in the middle of many" do
      last = SingleLinkedListElement.new("last")
      add_elements(@list)
      @list.add(last)
      add_elements(@list)
      @list.length().should == 9
      
      @list.remove(last).eql?(last).should be_true
      @list.length().should == 8      
    end

     it "should return the parent object  when 'insert_after' targets the middle of a list" do
      middle = SingleLinkedListElement.new("middle")
      after = SingleLinkedListElement.new("after")
      add_elements(@list)
      @list.add(middle)
      add_elements(@list)
      middle_next=middle.next_node
      @list.length().should == 9
      @list.insert_after(middle,after).eql?(middle).should be_true
      middle.next_node.eql?(after).should be_true
      after.next_node.eql?(middle_next).should be_true
      @list.length().should == 10
    end 

    it "should return the parent object  when 'insert_after' targets the head of a list" do
      head = SingleLinkedListElement.new("head")
      after = SingleLinkedListElement.new("after")
      @list.add(head)
      add_elements(@list)
      head_next=head.next_node
      @list.length().should == 5
      @list.insert_after(head,after).eql?(head).should be_true
      head.next_node.eql?(after).should be_true
      after.next_node.eql?(head_next).should be_true
      @list.length().should == 6
    end

    it "should return the parent object  when 'insert_after' targets the tail of a list" do
      last = SingleLinkedListElement.new("last")
      after = SingleLinkedListElement.new("after")
      add_elements(@list)
      @list.add(last)
      last_next=last.next_node
      @list.length().should == 5
      @list.insert_after(last,after).eql?(last).should be_true
      last.next_node.eql?(after).should be_true
      after.next_node.eql?(last_next).should be_true
      @list.length().should == 6
    end

    it "should return the inserted object  when 'insert_before' targets the middle of a list" do
      first_middle = SingleLinkedListElement.new("first_middle")
      second_middle = SingleLinkedListElement.new("second_middle")
      before = SingleLinkedListElement.new("before")
      add_elements(@list)
      @list.add(first_middle)
      @list.add(second_middle)
      add_elements(@list)
      @list.length().should == 10
      @list.insert_before(second_middle,before).eql?(before).should be_true
      before.next_node.eql?(second_middle).should be_true
      first_middle.next_node.eql?(before).should be_true
      @list.length().should == 11
    end     

    it "should return the inserted object  when 'insert_before' targets the head of a list" do
      first_head = SingleLinkedListElement.new("first_head")
      second_head = SingleLinkedListElement.new("second_head")
      before = SingleLinkedListElement.new("before")
      @list.add(first_head)
      @list.add(second_head)
      add_elements(@list)
      @list.length().should == 6
      @list.insert_before(first_head,before).eql?(before).should be_true
      before.next_node.eql?(first_head).should be_true
      @list.length().should == 7
    end     

    it "should return the inserted object  when 'insert_before' targets the tail of a list" do
      first_tail = SingleLinkedListElement.new("first_tail")
      second_tail = SingleLinkedListElement.new("second_tail")
      before = SingleLinkedListElement.new("before")
      add_elements(@list)
      @list.add(first_tail)
      @list.add(second_tail)
      @list.length().should == 6
      @list.insert_before(second_tail,before).eql?(before).should be_true
      before.next_node.eql?(second_tail).should be_true
      first_tail.next_node.eql?(before).should be_true
      @list.length().should == 7
    end     



  end

end
