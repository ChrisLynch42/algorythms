require 'spec_helper'
require 'single_linked_list_spec_helper'

describe SingleLinkedList do

  describe "Class" do
    it "should have method 'add'" do
      SingleLinkedList.method_defined?(:add).should be_true
    end

    it "should have method 'next'" do
      SingleLinkedList.method_defined?(:next).should be_true
    end
  end

  describe "Instance" do

    before(:each) do
      @list = SingleLinkedList.new()
    end

    it "should not return nil when 'next()' is called" do
      add_elements(@list)
      @list.next().should_not be_nil
    end
    
    it "should return 'one' when 'next().data' is called" do
      add_elements(@list)
      @list.next().data.should == "one"
    end    

  end

end
