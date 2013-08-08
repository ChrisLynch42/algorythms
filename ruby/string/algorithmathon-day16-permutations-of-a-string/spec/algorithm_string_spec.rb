require 'spec_helper'

describe AlgorithmString do

  describe "Class" do
    it "should have method 'permutate'" do
      AlgorithmString.method_defined?(:permutate).should be_true
    end
  end

  describe "Instance" do

    before(:each) do
    end

    it "should not return nil when 'permutate()' is called" do
      @string.permutate().should_not be_nil
    end

    it "should return 6 when 'permutate()' is called" do
      @string = AlgorithmString.new('ABC')
      @string.permutate().length.should == 6
    end 
     it "should return 24 when 'permutate()' is called" do
      @string = AlgorithmString.new('ABCDEF')
      @string.permutate().length.should == 24
    end   
  end

end
