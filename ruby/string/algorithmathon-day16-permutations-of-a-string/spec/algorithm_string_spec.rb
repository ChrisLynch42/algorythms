require 'spec_helper'

describe AlgorithmString do

  describe "Class" do
    it "should have method 'permutate'" do
      AlgorithmString.method_defined?(:permutate).should be_true
    end

    it "should have method 'iteration_count'" do
      AlgorithmString.method_defined?(:iteration_count).should be_true
    end    
  end

  describe "Instance" do

    before(:each) do
    end

    describe "'ABC' permutations" do
      before(:each) do
        @string = AlgorithmString.new('ABC')
      end

      describe "When 'permutate()' is called" do
        it "should not return nil" do
          @string.permutate().should_not be_nil
        end

        it "should return 6" do
          @string.permutate().length.should == 6
        end 

        it "should return 6 when 'iteration_count' is called" do
          @string.permutate()
          @string.iteration_count.should == 6
        end 

        it "should match @verify_array" do
          verify_array = "ABC".chars.to_a.permutation.map(&:join)
          local_array = @string.permutate()
          verify_array.each { | value |
            local_array.include?(value).should be_true
          }
        end
      end

      describe "When 'permutate2()' is called" do
        it "should not return nil" do
          @string.permutate2().should_not be_nil
        end

        it "should return 6" do
          @string.permutate2().length.should == 6
        end 

        it "should return 6 when 'iteration_count' is called" do
          @string.permutate2()
          @string.iteration_count.should == 6
        end 

        it "should match @verify_array" do
          verify_array = "ABC".chars.to_a.permutation.map(&:join)
          local_array = @string.permutate2()
          verify_array.each { | value |
            local_array.include?(value).should be_true
          }
        end
      end

      describe "When 'permutate3()' is called" do
        it "should not return nil" do
          @string.permutate3().should_not be_nil
        end

        it "should return 6" do
          @string.permutate3().length.should == 6
        end 

        it "should return 6 when 'iteration_count' is called" do
          @string.permutate3()
          @string.iteration_count.should == 6
        end 

        it "should match @verify_array" do
          verify_array = "ABC".chars.to_a.permutation.map(&:join)
          local_array = @string.permutate3()
          verify_array.each { | value |
            local_array.include?(value).should be_true
          }
        end
      end

      describe "When 'permutate4()' is called" do
        it "should not return nil" do
          @string.permutate4().should_not be_nil
        end

        it "should return 6" do
          @string.permutate4().length.should == 6
        end 

        it "should return 6 when 'iteration_count' is called" do
          @string.permutate4()
          @string.iteration_count.should == 6
        end 

        it "should match @verify_array" do
          verify_array = "ABC".chars.to_a.permutation.map(&:join)
          local_array = @string.permutate4()
          verify_array.each { | value |
            local_array.include?(value).should be_true
          }
        end
      end

    end
    describe "'ABCD' permutations" do
      before(:each) do
        @string = AlgorithmString.new('ABCD')
      end
      it "should return 24 when 'permutate()' is called" do
        @string.permutate().length.should == 24
      end   
      it "should return 24 when 'permutate()' is called" do
        @string.permutate()
        @string.iteration_count.should == 24
      end

      it "should return 24 when 'permutate2()' is called" do
        @string.permutate2().length.should == 24
      end   
      it "should return 24 when 'permutate2()' is called" do
        @string.permutate2()
        @string.iteration_count.should == 24
      end            
    end
  end

end
