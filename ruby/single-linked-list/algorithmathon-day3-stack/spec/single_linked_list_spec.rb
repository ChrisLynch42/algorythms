require 'spec_helper'

describe SingleLinkedList do

  describe "Class" do
    it "should have method 'push'" do
      SingleLinkedList.method_defined?(:push).should be_true
    end

    it "should have method 'pop'" do
      SingleLinkedList.method_defined?(:pop).should be_true
    end


  end

  describe "Instance" do

    before(:each) do
      @list = SingleLinkedList.new()
    end

    it "should return first object when 'push' is called and successful" do
      first = SingleLinkedListElement.new("first")
      @list.push(first).eql?(first).should be_true
    end

    it "should return first object when 'pop' is called" do
      first = SingleLinkedListElement.new("first")
      @list.push(first)
      @list.pop().eql?(first).should be_true
    end    

    it "should return all objects popped in the reverse order they where pushed" do
      first = SingleLinkedListElement.new("first")
      second = SingleLinkedListElement.new("second")
      third = SingleLinkedListElement.new("third")
      fourth = SingleLinkedListElement.new("fourth")
      fifth = SingleLinkedListElement.new("fifth")
      @list.push(first).eql?(first).should be_true
      @list.push(second).eql?(second).should be_true
      @list.push(third).eql?(third).should be_true
      @list.push(fourth).eql?(fourth).should be_true
      @list.push(fifth).eql?(fifth).should be_true
      @list.pop().eql?(fifth).should be_true
      @list.pop().eql?(fourth).should be_true
      @list.pop().eql?(third).should be_true
      @list.pop().eql?(second).should be_true
      @list.pop().eql?(first).should be_true
    end    

  end

end
