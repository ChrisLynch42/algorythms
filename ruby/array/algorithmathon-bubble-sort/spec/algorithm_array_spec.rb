require 'spec_helper'

describe BubbleSortArray do

  describe "Class" do
    before(:each) do
      @array = BubbleSortArray.new()
    end

    it "should have method 'new_find'" do
      expect(BubbleSortArray.instance_methods().include?(:new_find)).to equal(true)
    end
  end

  describe "Instance" do


    describe "Verify bubble sort is working" do
      before(:each) do
        @array = BubbleSortArray.[](1,31,7,23,13,17,19,11,29,3)
      end

      it "should return 2 when 'new_find(7)' is called" do
        expect(@array.new_find(7)).to equal(2)
      end

      it "should return 0 when 'new_find(1)' is called" do
        expect(@array.new_find(1)).to equal(0)
      end

      it "should return 8 when 'new_find(29)' is called" do
        expect(@array.new_find(29)).to equal(8)
      end

      it "should return 4 when 'new_find(13)' is called" do
        expect(@array.new_find(13)).to equal(4)
      end

      it "should return nil when 'new_find(443)' is called" do
        expect(@array.new_find(443)).to equal(nil)
      end
    end

  end

end
