require 'spec_helper'

describe DoubleLinkedListElement do
  describe "Class" do
    it "should have a 'next_node' method" do
      DoubleLinkedListElement.method_defined?(:next_node).should be_true
    end
    it "should have a 'prev_node' method" do
      DoubleLinkedListElement.method_defined?(:prev_node).should be_true
    end    
    it "should have a 'data' method" do
      DoubleLinkedListElement.method_defined?(:data).should be_true
    end

  end
end
