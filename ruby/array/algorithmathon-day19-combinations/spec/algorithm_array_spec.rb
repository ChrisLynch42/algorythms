require 'spec_helper'

describe AlgorithmArray do

  describe "Class" do
    it "should have method 'combinations'" do
      AlgorithmArray.method_defined?(:combinations).should be_true
    end

  end

  describe "Instance" do
    before(:each) do
    end

    it "should return 3 when '[].combinations(2).length' is called" do
      @array = AlgorithmArray.[](1,2,3)
      @array.combinations(2).length.should == 3
    end

    it "should return 10 when '[].combinations(3).length' is called" do
      @array = AlgorithmArray.[](1,2,3,4,5)
      @array.combinations(3).length.should == 10
    end

    it "should return 20 when '[].combinations(3).length' is called" do
      @array = AlgorithmArray.[](1,2,3,4,5,6)
      @array.combinations(3).length.should == 20
    end

    it "should return 15 when '[1,2,3,4,5,6].combinations(4).length' is called" do
      @array = AlgorithmArray.[](1,2,3,4,5,6)
      @array.combinations(4).length.should == 15
    end

  end
end
