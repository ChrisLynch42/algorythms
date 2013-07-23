require 'spec_helper'

describe BinaryTreeNode do

  describe "Class" do
    it "should have method 'left'" do
      BinaryTreeNode.method_defined?(:left).should be_true
    end

    it "should have method 'right'" do
      BinaryTreeNode.method_defined?(:left).should be_true
    end


    it "should have method 'data'" do
      BinaryTreeNode.method_defined?(:data).should be_true
    end    
  end

  describe "Instance" do

    before(:each) do
      @node = BinaryTreeNode.new()
    end

    it "should not be nil" do
      @node.should_not be_nil
    end

  end

end
