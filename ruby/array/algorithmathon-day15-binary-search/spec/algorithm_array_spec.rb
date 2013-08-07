require 'spec_helper'

describe AlgorithmArray do

  describe "Class" do
    it "should have method 'new_find'" do
      AlgorithmArray.method_defined?(:new_find).should be_true
    end
  end

  describe "Instance" do


    describe "Start search from default location" do
      before(:each) do
        @array = AlgorithmArray.[](1,3,7,11,13,17,19,23,29,31)
      end

      it "should return 2 when 'new_find(7)' is called" do
        @array.new_find(7).should == 2
      end

      it "should return 0 when 'new_find(1)' is called" do
        @array.new_find(1).should == 0
      end

      it "should return 8 when 'new_find(29)' is called" do
        @array.new_find(29).should == 8
      end

      it "should return 4 when 'new_find(13)' is called" do
        @array.new_find(13).should == 4
      end    
    end

    describe "Start search from end location" do
      before(:each) do
        @array = AlgorithmArray.[](1,3,7,11,13,17,19,23,29,31)
      end

      it "should return 2 when 'new_find(7,9)' is called" do
        @array.new_find(7,9).should == 2
      end

      it "should return 0 when 'new_find(1,9)' is called" do
        @array.new_find(1,9).should == 0
      end

      it "should return 8 when 'new_find(29,9)' is called" do
        @array.new_find(29,9).should == 8
      end

      it "should return 4 when 'new_find(13,9)' is called" do
        @array.new_find(13,9).should == 4
      end    
    end

    describe "Start search from first location" do
      before(:each) do
        @array = AlgorithmArray.[](1,3,7,11,13,17,19,23,29,31)
      end

      it "should return 2 when 'new_find(7,0)' is called" do
        @array.new_find(7,0).should == 2
      end

      it "should return 0 when 'new_find(1,0)' is called" do
        @array.new_find(1,0).should == 0
      end

      it "should return 8 when 'new_find(29,0)' is called" do
        @array.new_find(29,0).should == 8
      end

      it "should return 4 when 'new_find(13,0)' is called" do
        @array.new_find(13,0).should == 4
      end    
    end    
  end

end
