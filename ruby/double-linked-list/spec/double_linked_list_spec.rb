require 'spec_helper'

describe DoubleLinkedList do

  describe "Class" do
    it "should have method 'last'" do
      DoubleLinkedList.method_defined?(:last).should be_true
    end

    it "should have method 'add'" do
      DoubleLinkedList.method_defined?(:add).should be_true
    end

    it "should have method 'length'" do
      DoubleLinkedList.method_defined?(:length).should be_true
    end 

    it "should have method 'element_at'" do
      DoubleLinkedList.method_defined?(:element_at).should be_true
    end   
  end

  describe "Instance" do

    before(:each) do
      @list = DoubleLinkedList.new()
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

     it "should return 4 when 'length' is called" do
      add_elements(@list)
      @list.length().should == 4
    end 

     it "should return 'one' when 'element_at(0).data' is called" do
      add_elements(@list)
      @list.element_at(0).data.should == 'one'
      @list.element_at(1).data.should == 'two'
      @list.element_at(2).data.should == 'three'
      @list.element_at(3).data.should == 'four'
    end     

  end

end
