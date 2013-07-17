require 'spec_helper'

describe SingleLinkedListElement do
  describe "Class" do
    it "should have a 'next_node' method" do
      SingleLinkedListElement.method_defined?(:next_node).should be_true
    end
    it "should have a 'data' method" do
      SingleLinkedListElement.method_defined?(:data).should be_true
    end

  end
end
