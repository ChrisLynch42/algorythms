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

    it "should have method 'length'" do
      SingleLinkedList.method_defined?(:length).should be_true
    end    

    it "should have method 'retrieve'" do
      SingleLinkedList.method_defined?(:retrieve).should be_true
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

    it "should return 4 when 'length' is called" do
      add_elements(@list)
      @list.length().should == 4
    end

    it "should return the 5th object from the tail when 'retrieve(-5)' is called" do
      target = SingleLinkedListElement.new("target")
      add_elements(@list)
      @list.add(target)
      add_elements(@list)
      @list.retrieve(-5).eql?(target).should be_true
    end

    it "should return the 5th object from the head when 'retrieve(5)' is called" do
      target = SingleLinkedListElement.new("target")
      add_elements(@list)
      @list.add(target)
      add_elements(@list)
      @list.retrieve(5).eql?(target).should be_true
    end    

    it "should return the 1st object from the tail when 'retrieve(1)' is called" do
      target = SingleLinkedListElement.new("target")
      @list.add(target)
      add_elements(@list)
      @list.retrieve(1).eql?(target).should be_true
    end

    it "should return the tail when 'retrieve(-1)' is called" do
      target = SingleLinkedListElement.new("target")
      add_elements(@list)
      add_elements(@list)
      @list.add(target)
      @list.retrieve(-1).eql?(target).should be_true
    end

  end
end
