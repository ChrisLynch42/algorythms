require 'spec_helper'

describe BinarySearchTreeNode do

  describe "Class" do
    it "should have method 'greater'" do
      BinarySearchTreeNode.method_defined?(:greater).should be_true
    end

    it "should have method 'lesser'" do
      BinarySearchTreeNode.method_defined?(:lesser).should be_true
    end 

     it "should have method 'data'" do
      BinarySearchTreeNode.method_defined?(:data).should be_true
    end 

    it "should have method 'less_than?'" do
      BinarySearchTreeNode.method_defined?(:less_than?).should be_true
    end     

    it "should have method 'greater_than?'" do
      BinarySearchTreeNode.method_defined?(:greater_than?).should be_true
    end     
  end

  describe "Instance" do

    before(:each) do
      @node = BinarySearchTreeNode.new(5)
    end

    it "should not be nil" do
      @node.should_not be_nil
    end

    it "should not throw an exeption because greater, lesser and parent are nil" do
      expect {parent = BinarySearchTreeNode.new(5)}.to_not raise_error
    end

    it "should throw an exeption because lesser is more than greater" do
      lesser = BinarySearchTreeNode.new(10)
      greater = BinarySearchTreeNode.new(5)
      expect {parent = BinarySearchTreeNode.new(7,lesser,greater)}.to raise_error
    end

    it "should throw an exeption because lesser is not nil and greater is" do
      lesser = BinarySearchTreeNode.new(10)
      expect { parent = BinarySearchTreeNode.new(7,lesser) }.to raise_error
    end

    it "should not throw an exeption because lesser is less than greater" do
      lesser = BinarySearchTreeNode.new(5)
      greater = BinarySearchTreeNode.new(10)
      expect {parent = BinarySearchTreeNode.new(7,lesser,greater)}.to_not raise_error
    end

    it "should not throw an exeption because lesser is nil and greater is not" do
      greater = BinarySearchTreeNode.new(10)
      expect {parent = BinarySearchTreeNode.new(7,nil,greater)}.to_not raise_error
    end    

    it "should not throw an exeption because lesser and greater are nil" do
      expect {parent = BinarySearchTreeNode.new(7)}.to_not raise_error
    end    

    it "should throw an exeption because lesser and greater are equal" do
      lesser = BinarySearchTreeNode.new(10)
      greater = BinarySearchTreeNode.new(10)
      expect {parent = BinarySearchTreeNode.new(7,lesser,greater)}.to raise_error
    end    

    it "should throw an exeption because lesser and parent are equal" do
      lesser = BinarySearchTreeNode.new(7)
      greater = BinarySearchTreeNode.new(10)
      expect {parent = BinarySearchTreeNode.new(7,lesser,greater)}.to raise_error
    end

    it "should throw an exeption because greater and parent are equal" do
      lesser = BinarySearchTreeNode.new(3)
      greater = BinarySearchTreeNode.new(7)
      expect {parent = BinarySearchTreeNode.new(7,lesser,greater)}.to raise_error
    end    

    it "should return true when lesser.lesser_than?(greater) is called" do
      lesser = BinarySearchTreeNode.new(3)
      greater = BinarySearchTreeNode.new(7)
      lesser.less_than?(greater).should be_true
    end    

    it "should return false when greater.greater_than?(lesser) is called" do
      lesser = BinarySearchTreeNode.new(3)
      greater = BinarySearchTreeNode.new(7)
      greater.greater_than?(lesser).should be_true
    end
  end

end
