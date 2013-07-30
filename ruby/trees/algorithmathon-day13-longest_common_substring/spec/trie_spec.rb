require 'spec_helper'

describe Trie do

  describe "Class" do
    it "should have method 'root'" do
      Trie.method_defined?(:root).should be_true
    end 

    it "should have method 'add'" do
      Trie.method_defined?(:add).should be_true
    end 

    it "should have method 'add_suffixes'" do
      Trie.method_defined?(:add_suffixes).should be_true
    end 

    it "should have method 'longest_common_substring'" do
      Trie.method_defined?(:longest_common_substring).should be_true
    end    

  end

  describe "Instance" do


    describe "Add method tests" do
      before(:each) do
        @trie = Trie.new()
        @trie.add("ABCDEFG",0)
        @trie.add("DEFGHIJK",1)
      end

      it "should not return nil when 'root' is called" do
        @trie.root.should_not be_nil
      end

  
      it "should not return nil when 'root[65]' is called" do
        @trie.root[65].should_not be_nil
      end

      it "should not return nil when 'root[68]' is called" do
        @trie.root[68].should_not be_nil
      end    

      it "should not return nil when 'root[65][66]' is called" do
        @trie.root[65][66].should_not be_nil
      end        

      it "should not return nil when 'root[65][66][67][68][69][70][71]' is called" do
        @trie.root[65][66][67][68][69][70][71].should_not be_nil
      end

      it "should not return 1 when 'root[65][66][67][68][69][70][71].length' is called" do
        @trie.root[65][66][67][68][69][70][71].length.should == 2
      end 

      it "should not return 1 when 'root[65][66][67][68][69][70][71][0]' is called" do
        @trie.root[65][66][67][68][69][70][71][0].should == 1
      end

      describe "Markers indicating a specific string" do
        it "should not return nil when 'root[68][1]' is called" do
          @trie.root[68][1].should_not be_nil
        end 

        it "should return true when 'root[68][1][1]' is called" do
          @trie.root[68][1][1].should be_true
        end

        it "should return false when 'root[68][1][0]' is called" do
          @trie.root[68][1][0].should be_false
        end    
      end    
    end
    describe "Add_suffix method tests" do
      before(:each) do
        @trie = Trie.new()
        @trie.add_suffixes("ABCDEFG",0)
        @trie.add_suffixes("FGHIJK",1)
      end

      it "should not return nil when 'root[65]' is called" do
        @trie.root[65].should_not be_nil
      end      

      it "should not return nil when 'root[68]' is called" do
        @trie.root[68].should_not be_nil
      end

      it "should not return nil when 'root[72]' is called" do
        @trie.root[72].should_not be_nil
      end

      it "should not return nil when 'root[75]' is called" do
        @trie.root[75].should_not be_nil
      end

      it "should return false when 'root[69][1][1]' is called" do
        @trie.root[69][1][1].should be_false
      end

      it "should return true when 'root[69][1][0]' is called" do
        @trie.root[69][1][0].should be_true
      end

      it "should return true when 'root[70][1][0]' is called" do
        @trie.root[70][1][0].should be_true
      end

      it "should return true when 'root[70][1][1]' is called" do
        @trie.root[70][1][1].should be_true
      end

      it "should return true when 'root[71][1][0]' is called" do
        @trie.root[71][1][0].should be_true
      end

      it "should return true when 'root[71][1][1]' is called" do
        @trie.root[71][1][1].should be_true
      end

      it "should return false when 'root[72][1][0]' is called" do
        @trie.root[72][1][0].should be_false
      end

      it "should return true when 'root[72][1][1]' is called" do
        @trie.root[72][1][1].should be_true
      end

    end

    describe "Longest common substring method tests" do
      it "should return 'bcd' when Trie.longest_common_substring(ABCD,BCDE)  is called" do
        trie= Trie.new()
        trie.longest_common_substring('ABCD','BCDE').should == 'BCD'
      end

      it "should return 'try' when Trie.longest_common_substring(TRY,RETRY)  is called" do
        trie= Trie.new()
        trie.longest_common_substring('TRY','RETRY').should == 'TRY'
      end 

       it "should return 'FGH' when Trie.longest_common_substring(ABCDFGHXYZ,TSVPFGHARS)  is called" do
        trie= Trie.new()
        trie.longest_common_substring('ABCDFGHXYZ','TSVPFGHARS').should == 'FGH'
      end     
    end



  end

end
