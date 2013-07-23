require 'spec_helper'

describe BinarySearchTree do

  describe "Class" do
    it "should have method 'root'" do
      BinarySearchTree.method_defined?(:root).should be_true
    end

    it "should have method 'add'" do
      BinarySearchTree.method_defined?(:add).should be_true
    end    
  end

  describe "Instance" do

    before(:each) do
      @tree = BinarySearchTree.new()
    end

    it "should have node(5) as the root when passed into constructor" do
      node = BinarySearchTreeNode.new(5)
      tree = BinarySearchTree.new(node)
      tree.root.should_not be_nil
      tree.root.data.should == 5
    end

    it "should have node(6) as the root when add(node(5)) is called" do
      node = BinarySearchTreeNode.new(5)
      tree = BinarySearchTree.new()
      tree.add(node)
      tree.root.should_not be_nil
      tree.root.data.should == 5
    end    

    it "should have add(node(5)) as the lesser of the root" do
      node = BinarySearchTreeNode.new(5)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(10))
      tree.add(node)
      tree.root.lesser.should_not be_nil
      tree.root.lesser.data.should == 5
    end

    it "should have add(node(15)) as the greater of the root" do
      node = BinarySearchTreeNode.new(15)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(10))
      tree.add(node)
      tree.root.greater.should_not be_nil
      tree.root.greater.data.should == 15
    end 

    it "should have add(node(10)) raise an error" do
      node = BinarySearchTreeNode.new(10)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(10))
      expect { tree.add(node) }.to raise_error
    end   

    it "should have add(node(50)) as the lesser of the root.lesser" do
      node1 = BinarySearchTreeNode.new(75)
      node2 = BinarySearchTreeNode.new(50)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(100))
      tree.add(node1)
      tree.add(node2)
      tree.root.lesser.should_not be_nil
      tree.root.lesser.lesser.should_not be_nil
      tree.root.lesser.lesser.data.should == 50
    end

    it "should have add(node(85)) as the greater of the root.lesser" do
      node1 = BinarySearchTreeNode.new(75)
      node2 = BinarySearchTreeNode.new(85)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(100))
      tree.add(node1)
      tree.add(node2)
      tree.root.lesser.should_not be_nil
      tree.root.lesser.greater.should_not be_nil
      tree.root.lesser.greater.data.should == 85
    end 

     it "should have add(node(150)) as the greater of the root" do
      node1 = BinarySearchTreeNode.new(150)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(100))
      tree.add(node1)
      tree.root.greater.should_not be_nil
      tree.root.greater.data.should == 150
    end 

     it "should return 125 when it recieves the root.greater.lesser.data call" do
      node1 = BinarySearchTreeNode.new(150)
      node2 = BinarySearchTreeNode.new(75)
      node3 = BinarySearchTreeNode.new(125)
      tree = BinarySearchTree.new(BinarySearchTreeNode.new(100))
      tree.add(node1)
      tree.add(node2)
      tree.add(node3)
      tree.root.greater.should_not be_nil
      tree.root.greater.lesser.should_not be_nil
      tree.root.greater.lesser.data.should == 125
    end

  end

end
