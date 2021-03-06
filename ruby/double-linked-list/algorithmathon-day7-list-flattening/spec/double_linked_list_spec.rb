require 'spec_helper'

describe DoubleLinkedList do

  describe "Class" do
    it "should have method 'last'" do
      DoubleLinkedList.method_defined?(:last).should be_true
    end

    it "should have method 'add'" do
      DoubleLinkedList.method_defined?(:add).should be_true
    end

    it "should have method 'length'" do
      DoubleLinkedList.method_defined?(:length).should be_true
    end 

    it "should have method 'element_at'" do
      DoubleLinkedList.method_defined?(:element_at).should be_true
    end   
  end

  describe "Instance" do

    before(:each) do
      @list = DoubleLinkedList.new()
    end

    it "should return nil when 'last()' is called" do
      @list.last().should be_nil
    end

    it "should not return nil when 'last()' is called" do
      add_elements(@list)
      @list.last().should_not be_nil
    end
    
    it "should return 'four' when 'last().data' is called" do
      add_elements(@list)
      @list.last().data.should == "four"
    end 

     it "should return 4 when 'length' is called" do
      add_elements(@list)
      @list.length().should == 4
    end 

     it "should return 'one' when 'element_at(0).data' is called" do
      add_elements(@list)
      @list.element_at(0).data.should == 'one'
      @list.element_at(1).data.should == 'two'
      @list.element_at(2).data.should == 'three'
      @list.element_at(3).data.should == 'four'
    end

    it "should build a non flat list correctly" do
      list = build_master_list()
      list.length().should == 12
      list.element_at(0).child.length().should == 6
      list.element_at(0).child.last().child.length().should == 8
      list.element_at(4).child.length().should == 8
      list.element_at(4).child.element_at(2).child.length().should == 8
      list.element_at(11).child.length().should == 3
      list.element_at(11).child.element_at(0).child.length().should == 6
    end     

    it "should have a length of 51 when it receives the 'flatten!' message" do
      list = build_master_list()
      list.flatten!()
      list.length().should == 51
    end 

    it "should return '13' when it receives the message 'element_at(12).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(1).data.should == '13'
    end 

    it "should return '18' when it receives the message 'element_at(6).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(6).data.should == '18'
    end

    it "should return '19' when it receives the message 'element_at(7).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(7).data.should == '19'
    end 

    it "should return '5' when it receives the message 'element_at(18).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(18).data.should == '5'
    end

    it "should return '27' when it receives the message 'element_at(19).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(19).data.should == '27'
    end


    it "should return '51' when it receives the message 'element_at(48).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(48).data.should == '51'
    end 

    it "should return '45' when it receives the message 'element_at(50).data'" do
      list = build_master_list()
      list.flatten!()
      list.element_at(50).data.should == '45'
    end

  end

end
