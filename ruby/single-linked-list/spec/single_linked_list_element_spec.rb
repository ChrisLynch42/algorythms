require 'spec_helper'

describe SingleLinkedListElement do
  describe "Class" do
    it "should have a 'next' method" do
      SingleLinkedListElement.method_defined?(:next).should be_true
    end
    it "should have a 'data' method" do
      SingleLinkedListElement.method_defined?(:data).should be_true
    end

  end
end
