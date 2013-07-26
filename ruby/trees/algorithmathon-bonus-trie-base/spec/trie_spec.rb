require 'spec_helper'

describe Trie do

  describe "Class" do
    it "should have method 'root'" do
      Trie.method_defined?(:root).should be_true
    end 

    it "should have method 'add'" do
      Trie.method_defined?(:add).should be_true
    end   

  end

  describe "Instance" do

    before(:each) do
      @trie = Trie.new()
      @trie.add("ABCDEFG")
    end

    it "should not return nil when 'root' is called" do
      @trie.root.should_not be_nil
    end

    it "should not return nil when 'root[65]' is called" do
      @trie.root[65].should_not be_nil
    end    
    
    it "should not return nil when 'root[65][66]' is called" do
      @trie.root[65][66].should_not be_nil
    end        

    it "should not return nil when 'root[65][66][67][68][69][70][71]' is called" do
      @trie.root[65][66][67][68][69][70][71].should_not be_nil
    end

    it "should not return 1 when 'root[65][66][67][68][69][70][71].length' is called" do
      @trie.root[65][66][67][68][69][70][71].length.should == 1
    end 

     it "should not return 1 when 'root[65][66][67][68][69][70][71][0]' is called" do
      @trie.root[65][66][67][68][69][70][71][0].should == 1
    end   
  end

end
