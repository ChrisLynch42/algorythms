Algorithmathon Day 8: Double Linked List Unflattening
==========

On Day 8 we will be unflattening the Double Linked List (DoLL) that we flattened on Day 7 of the Algorithmathon.  As always we will be following the Rules of Algorithmathon.  For your viewing pleasure the source code is also available.  How do we go about achieving this unflattening?  It seems likely what we need to do is to reverse the flattening process.  A good first step would be to list out the rules we used for flattening the list.
<ol>
<li>Starting at the head check each element for a child</li>
<li>If the element has a child, link the child elements into the top list<li>
<li>Continue to the next element.  (Which will be the first element in the child list if one existed)</li>
<li></li>
</ol>

What needs to be done to reverse this process?  Well we should probably start at the beginning which will be the same as the flattening.  

<ol>
<li>Starting at the head check each element for a child</li>
<li>If the element has a child, unlink the child elements from the top list<li>
<li>With the child as the target go to step 1</li>
<li>Continue to the next element.  (Which will be the element after the tail of the child list if there was a child)</li>
<li></li>
</ol>

As always we need to create our tests.  We should be able to reuse our test that verified our helper methods.

<pre>
#code omitted here
    it "should have method 'unflatten!'" do
      DoubleLinkedList.method_defined?(:element_at).should be_true
    end  
#code omitted here
    it "should have the correct non flat list when the 'unflatten!' method is called." do
      list = build_master_list()
      list.flatten!()
      list.unflatten!()
      list.length().should == 12
      list.element_at(0).child.length().should == 6
      list.element_at(0).child.last().child.length().should == 8
      list.element_at(4).child.length().should == 8
      list.element_at(4).child.element_at(2).child.length().should == 8
      list.element_at(11).child.length().should == 3
      list.element_at(11).child.element_at(0).child.length().should == 6
    end

#code omitted here
</pre>



