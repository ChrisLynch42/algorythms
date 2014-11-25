require 'spec_helper'

describe MergeSortArray do

  describe "Class" do
    before(:each) do
      @array = MergeSortArray.new()
    end

    it "should have method 'new_find'" do
      expect(MergeSortArray.instance_methods().include?(:new_find)).to equal(true)
    end

    it "should have method 'new_find'" do
      expect(MergeSortArray.instance_methods().include?(:merge_arrays)).to equal(true)
    end
  end

  describe "Instance" do


    describe "Verify merge support methods work correctly" do
      @merge_instance = MergeSortArray.new()
      @array_one = [1,3]
      @array_two = [2,4]
      @array_result = [1,2,3,4]

      before(:each) do
        @merge_instance = MergeSortArray.new()
        @array_one = [1,3]
        @array_two = [2,4]
        @array_result = [1,2,3,4]
      end

      it "should have a return_array equal to [1,2] when add_to_array([],1,2) message is sent" do
        return_array = []
        @merge_instance.add_to_array(return_array,1,2)
        expect(return_array).to eq([1,2])
      end

      it "should have a return_array equal to [1,2] when add_to_array([],1,2) message is sent" do
        return_array = [1,2]
        @merge_instance.add_array_to_array(return_array,[1,2])
        expect(return_array).to eq([1,2,1,2])
      end


      it "should return #{@array_result.to_s} when #{@array_one.to_s} and #{@array_two.to_s} is sent to merge_arrays" do
        expect(@merge_instance.merge_arrays(@array_one,@array_two)).to eq(@array_result)
      end

    end



    describe "Verify merge sort is working" do
      before(:each) do
        @array = MergeSortArray.[](1,31,7,23,13,17,19,11,29,3)
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
