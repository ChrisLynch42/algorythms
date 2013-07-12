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

  end

end
