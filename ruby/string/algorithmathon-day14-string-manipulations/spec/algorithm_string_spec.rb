require 'spec_helper'

describe AlgorithmString do

  describe "Class" do
    it "should have method 'new_remove'" do
      AlgorithmString.method_defined?(:new_remove).should be_true
    end
    it "should have method 'new_reverse!'" do
      AlgorithmString.method_defined?(:new_reverse!).should be_true
    end

    it "should have method 'string_to_integer'" do
      AlgorithmString.method_defined?(:string_to_integer).should be_true
    end 
    it "should have method 'integer_to_string'" do
      AlgorithmString.method_defined?(:integer_to_string).should be_true
    end   
  end

  describe "Instance" do

    before(:each) do
      @string = AlgorithmString.new('ABCABCABCABC')
    end

    it "should not be nil" do
      @string.should_not be_nil
    end

    it "should return nil when 'new_remove()' is called" do
      @string.new_remove(nil).should be_nil
    end

    it "should return 'AAAA' when 'new_remove([B,C,D])' is called" do
      @string.new_remove(['B','C','D']).should == 'AAAA'
    end

    it "should return 'CBACBACBACBA' when 'new_reverse!()' is called" do
      @string.new_reverse!().should == 'CBACBACBACBA'
    end

    it "should return 'ABCABCDABCABC' when 'new_reverse!()' is called" do
      @string = AlgorithmString.new('ABCABCDABCABC')
      @string.new_reverse!().should == 'CBACBADCBACBA'
    end

    it "should return -245 when 'string_to_integer()' is called" do
      @string = AlgorithmString.new('-245')
      @string.string_to_integer.should == -245
    end

    it "should return '-245' when 'integer_to_string(-245)' is called" do
      @string = AlgorithmString.new('test')
      @string.integer_to_string(-245).should == '-245'
    end
  end

end
