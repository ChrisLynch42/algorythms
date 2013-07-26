require 'spec_helper'

describe AlgorithmString do

  describe "Class" do
    it "should have method 'first_nonrepeated'" do
      AlgorithmString.method_defined?(:first_nonrepeated).should be_true
    end
  end

  describe "Instance" do

    before(:each) do
      @string = AlgorithmString.new('ABABCABAB')
    end

    it "should not be nil" do
      @string.should_not be_nil
    end

    it "should return nil when 'first_nonrepeated()' method is called" do
      @string.first_nonrepeated().should_not be_nil
    end

    it "should return nil when 'first_nonrepeated()' method is called" do
      @string.first_nonrepeated().should == 'C'
    end

  end

end
