require 'spec_helper'

describe TelephoneWords do

  describe "Class" do
    it "should have method 'build_words'" do
      TelephoneWords.method_defined?(:build_words).should be_true
    end
  end

  describe "Instance" do

    it "should not return nil when 'build_words([2,2,2])' is called" do
      telephone_words = TelephoneWords.new()
      number_array = [2,2,2]
      telephone_words.build_words(number_array).should_not be_nil
    end

    it "should return 27 when 'build_words([2,2,2]).length' is called" do
      telephone_words = TelephoneWords.new()
      number_array = [2,2,2]
      telephone_words.build_words(number_array).length.should == 27
    end 

    it "should return 27 when 'build_words([1,2,2,2]).length' is called" do
      telephone_words = TelephoneWords.new()
      number_array = [1,2,2,2]
      telephone_words.build_words(number_array).length.should == 27
    end   

    it "should return 27 when 'build_words([2,2,2,1]).length' is called" do
      telephone_words = TelephoneWords.new()
      number_array = [2,2,2,1]
      telephone_words.build_words(number_array).length.should == 27
    end 

    it "should return 27 when 'build_words([2,1,2,2]).length' is called" do
      telephone_words = TelephoneWords.new()
      number_array = [2,1,2,2]
      telephone_words.build_words(number_array).length.should == 27
    end  

    it "should return 2916 when 'build_words([3,5,2,2,9,6,6]).length' is called" do
      telephone_words = TelephoneWords.new()
      number_array = [3,5,2,2,9,6,6]
      telephone_words.build_words(number_array).length.should == 2916
    end  


  end

end
