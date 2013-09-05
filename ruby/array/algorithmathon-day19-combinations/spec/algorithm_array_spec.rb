require 'spec_helper'

describe AlgorithmArray do

  describe "Class" do
    it "should have method 'combinations'" do
      AlgorithmArray.method_defined?(:combinations).should be_true
    end

    it "should have method 'get_next_position'" do
      AlgorithmArray.method_defined?(:get_next_position).should be_true
    end
  end

  describe "Instance" do
    before(:each) do
    end

    it "should return 2 when 'get_next_position' is called" do
      @array = AlgorithmArray.[](1,2,3)
      @array.get_next_position(1).should == 2
    end

    it "should return 0 when 'get_next_position' is called" do
      @array = AlgorithmArray.[](1,2,3)
      @array.get_next_position(2).should == 0
    end

    it "should return 3 when 'combinations(2).length' is called" do
      @array = AlgorithmArray.[](1,2,3)
      @array.combinations(2).length.should == 3
    end

    it "should return 9 when 'combinations(3).length' is called" do
      @array = AlgorithmArray.[](1,2,3,4,5)
      @array.combinations(3).length.should == 9
    end

  end
end
