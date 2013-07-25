require 'spec_helper'

describe BinarySearchTree do

  describe "Class" do
    it "should have method 'root'" do
      BinarySearchTree.method_defined?(:root).should be_true
    end

    it "should have method 'add'" do
      BinarySearchTree.method_defined?(:add).should be_true
    end 

    it "should have method 'depth_preorder'" do
      BinarySearchTree.method_defined?(:depth_preorder).should be_true
    end 

    it "should have method 'depth_preorder_alt'" do
      BinarySearchTree.method_defined?(:depth_preorder_alt).should be_true
    end

     it "should have method 'lowest_common_ancestor'" do
      BinarySearchTree.method_defined?(:lowest_common_ancestor).should be_true
    end   

  end

  describe "Instance" do

    describe "Verify add method" do
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

    describe "Verify Depth First Preorder Traversal and Lowest Common Ancestor" do
      before(:each) do
        @tree = BinarySearchTree.new()
        @tree.add(BinarySearchTreeNode.new(100))
        @tree.add(BinarySearchTreeNode.new(50))
        @tree.add(BinarySearchTreeNode.new(20))
        @tree.add(BinarySearchTreeNode.new(70))
        @tree.add(BinarySearchTreeNode.new(10))
        @tree.add(BinarySearchTreeNode.new(30))
        @tree.add(BinarySearchTreeNode.new(60))
        @tree.add(BinarySearchTreeNode.new(80))
        @tree.add(BinarySearchTreeNode.new(90))
        @tree.add(BinarySearchTreeNode.new(40))

        @tree.add(BinarySearchTreeNode.new(150))
        @tree.add(BinarySearchTreeNode.new(120))
        @tree.add(BinarySearchTreeNode.new(170))
        @tree.add(BinarySearchTreeNode.new(110))
        @tree.add(BinarySearchTreeNode.new(130))
        @tree.add(BinarySearchTreeNode.new(160))
        @tree.add(BinarySearchTreeNode.new(180))
        @tree.add(BinarySearchTreeNode.new(190))
        @tree.add(BinarySearchTreeNode.new(140))
      end

      it "should have a properly constructed tree" do
        @tree.root.should_not be_nil
        @tree.root.data.should == 100

        @tree.root.lesser.should_not be_nil
        @tree.root.lesser.data.should == 50

        @tree.root.lesser.greater.should_not be_nil
        @tree.root.lesser.greater.data.should == 70

        @tree.root.lesser.lesser.should_not be_nil
        @tree.root.lesser.lesser.data.should == 20

        @tree.root.lesser.lesser.lesser.should_not be_nil
        @tree.root.lesser.lesser.lesser.data.should == 10

        @tree.root.greater.should_not be_nil
        @tree.root.greater.data.should == 150

        @tree.root.greater.greater.should_not be_nil
        @tree.root.greater.greater.data.should == 170

        @tree.root.greater.lesser.should_not be_nil
        @tree.root.greater.lesser.data.should == 120

        @tree.root.greater.greater.greater.should_not be_nil
        @tree.root.greater.greater.greater.data.should == 180

        @tree.root.greater.greater.greater.greater.should_not be_nil
        @tree.root.greater.greater.greater.greater.data.should == 190
      end 

      it "should not return nil when 'depth_preorder()' is called" do
        @tree.depth_preorder().should_not be_nil
      end

      it "should not return 19 when 'depth_preorder().length' is called" do
        @tree.depth_preorder().length.should == 19
      end

      it "should return 100 when 'depth_preorder()[0]' is called" do
        @tree.depth_preorder()[0].should == 100
      end

      it "should return 30 when 'depth_preorder()[4]' is called" do
        @tree.depth_preorder()[4].should == 30
      end 

      it "should return 90 when 'depth_preorder()[9]' is called" do
        @tree.depth_preorder()[9].should == 90
      end     

      it "should return 150 when 'depth_preorder()[10]' is called" do
        @tree.depth_preorder()[10].should == 150
      end     
      it "should return 130 when 'depth_preorder()[13]' is called" do
        @tree.depth_preorder()[13].should == 130
      end     

      it "should return 170 when 'depth_preorder()[15]' is called" do
        @tree.depth_preorder()[15].should == 170
      end 

      it "should not return nil when 'depth_preorder_alt()' is called" do
        @tree.depth_preorder_alt().should_not be_nil
      end

      it "should not return 19 when 'depth_preorder_alt().length' is called" do
        @tree.depth_preorder_alt().length.should == 19
      end

      it "should return 100 when 'depth_preorder_alt()[0]' is called" do
        @tree.depth_preorder_alt()[0].should == 100
      end

      it "should return 30 when 'depth_preorder_alt()[4]' is called" do
        @tree.depth_preorder_alt()[4].should == 30
      end 

      it "should return 90 when 'depth_preorder_alt()[9]' is called" do
        @tree.depth_preorder_alt()[9].should == 90
      end     

      it "should return 150 when 'depth_preorder_alt()[10]' is called" do
        @tree.depth_preorder_alt()[10].should == 150
      end     
      it "should return 130 when 'depth_preorder_alt()[13]' is called" do
        @tree.depth_preorder_alt()[13].should == 130
      end     

      it "should return 170 when 'depth_preorder_alt()[15]' is called" do
        @tree.depth_preorder_alt()[15].should == 170
      end

      it "should not return nil with 'lowest_common_ancestor(10,30)' is called" do
        @tree.lowest_common_ancestor(10,30).should_not be_nil
      end

      it "should return 20 with 'lowest_common_ancestor(10,30)' is called" do
        @tree.lowest_common_ancestor(10,30).should == 20
      end      

      it "should return 50 with 'lowest_common_ancestor(20,90)' is called" do
        @tree.lowest_common_ancestor(20,90).should == 50
      end

      it "should return 150 with 'lowest_common_ancestor(130,180)' is called" do
        @tree.lowest_common_ancestor(130,180).should == 150
      end

    end
  end

end

