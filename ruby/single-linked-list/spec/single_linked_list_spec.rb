require 'spec_helper'
require 'single_linked_list_spec_helper'

describe SingleLinkedList do

  describe "Class" do
    it "should have method 'length'" do
      SingleLinkedList.method_defined?(:length).should be_true
    end

    it "should have method 'add'" do
      SingleLinkedList.method_defined?(:add).should be_true
    end

    it "should have method 'next'" do
      SingleLinkedList.method_defined?(:next).should be_true
    end


    it "should have method 'list'" do
      SingleLinkedList.method_defined?(:list).should be_true
    end

    it "should have method 'list_no_recursion'" do
      SingleLinkedList.method_defined?(:list).should be_true
    end

    it "should have method 'list_no_recursion'" do
      SingleLinkedList.method_defined?(:list_no_recursion).should be_true
    end

    it "should have method 'list_reverse'" do    
      SingleLinkedList.method_defined?(:list_reverse).should be_true
    end


  end

  describe "Instance" do

    before(:each) do
      @list = SingleLinkedList.new()
    end

    it "should have a length of zero" do
      @list.length.should == 0
    end

    it "should have a length of four" do
      add_elements(@list)
      @list.length.should == 4
    end

    it "should not return nil when 'next()' is called" do
      add_elements(@list)
      @list.next().should_not be_nil
    end
    
    it "should return 'one' when 'next().data' is called" do
      add_elements(@list)
      @list.next().should == "one"
    end    

    it "should return '#{element_array()}' when 'list()' is called" do
      add_elements(@list)
      @list.list().should =~ element_array()
    end

    it "should return '#{element_array()}' when 'list_no_recursion()' is called" do
      add_elements(@list)
      @list.list_no_recursion().should =~ element_array()
    end


    it "should return '#{reverse_element_array()}' when 'list_reverse()' is called" do
      add_elements(@list)
      @list.list_reverse().should =~ reverse_element_array()
    end

    it "should take less time for list to run than list_no_recursion" do
      (1..1000).each { |a_number|
        @list.add(a_number.to_s)
      }

      start_time=Time.now
      @list.list_no_recursion()
      end_time=Time.now
      closure_time=end_time.to_f - start_time.to_f


      start_time=Time.now
      @list.list()
      end_time=Time.now
      recursion_time=end_time.to_f - start_time.to_f

      recursion_time.should > closure_time
    end
    
    it "should not raise error when using closure" do
      (1..100000).each { |a_number|
        @list.add(a_number.to_s)
      }

      lambda { @list.list_no_recursion()}.should_not raise_error
    end

    it "should raise error when using closure" do
      (1..100000).each { |a_number|
        @list.add(a_number.to_s)
      }

      lambda { @list.list()}.should raise_error
    end


  end

end
