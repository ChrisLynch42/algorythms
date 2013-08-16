require 'spec_helper'

shared_examples "a permutation" do | target_string, target_method, goal |

  describe "When #{target_method}' is called" do
    before(:each) do
      @string = AlgorithmString.new(target_string)
    end

    it "should not return nil" do
      @string.send(target_method).should_not be_nil
    end

    it "should return #{goal}" do
      @string.send(target_method).length.should == goal
    end 

    it "should return #{goal} when 'iteration_count' is called" do
      @string.send(target_method)
      @string.iteration_count.should == goal
    end 

    it "should match @verify_array" do
      verify_array = target_string.chars.to_a.permutation.map(&:join)
      local_array = @string.send(target_method)
      verify_array.each { | value |
        local_array.include?(value).should be_true
      }
    end
  end
end

describe AlgorithmString do  

  describe "Class" do
    it "should have method 'permutate'" do
      AlgorithmString.method_defined?(:permutate).should be_true
    end

    it "should have method 'permutate2'" do
      AlgorithmString.method_defined?(:permutate2).should be_true
    end

    it "should have method 'permutate3'" do
      AlgorithmString.method_defined?(:permutate3).should be_true
    end

    it "should have method 'iteration_count'" do
      AlgorithmString.method_defined?(:iteration_count).should be_true
    end    
  end

  describe "Instance" do

    describe "'ABC' permutations" do
      it_should_behave_like "a permutation", "ABC","permutate", 6 
      it_should_behave_like "a permutation", "ABC","permutate2", 6 
      it_should_behave_like "a permutation", "ABC","permutate3", 6 

    end
    describe "'ABCD' permutations" do
      it_should_behave_like "a permutation", "ABCD","permutate", 24 
      it_should_behave_like "a permutation", "ABCD","permutate2", 24 
      it_should_behave_like "a permutation", "ABCD","permutate3", 24

    end
    describe "'ABCDE' permutations" do
      it_should_behave_like "a permutation", "ABCDE","permutate", 120
      it_should_behave_like "a permutation", "ABCDE","permutate2", 120
      it_should_behave_like "a permutation", "ABCDE","permutate3", 120

    end    
  end 
end 
