require 'spec_helper'

describe TreeNode do

  describe "Class" do
    it "should have method 'children'" do
      TreeNode.method_defined?(:children).should be_true
    end

    it "should have method 'data'" do
      TreeNode.method_defined?(:data).should be_true
    end    
  end

  describe "Instance" do

    before(:each) do
      @node = TreeNode.new()
    end

    it "should not return nil when 'children()' is called" do
      @node.children().should_not be_nil
    end

  end

end
