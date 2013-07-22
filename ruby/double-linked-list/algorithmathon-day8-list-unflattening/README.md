Algorithmathon Day 8: Double Linked List Unflattening
==========

On Day 8 we will be unflattening the Double Linked List (DoLL) that we flattened on Day 7 of the Algorithmathon.  As always we will be following the Rules of Algorithmathon.  For your viewing pleasure the source code is also available.  How do we go about achieving this unflattening?  It seems likely what we need to do is to reverse the flattening process.  

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

To try to grasp how we might solve this problem we should list out the rules we used for flattening the list.

<ol>
<li>Starting at the head check each element for a child</li>
<li>If the element has a child,
<ol> 
  <li>link the child elements into the top list.<li>
  <li>Return to step 1 with the child list's first element as a target.<li>
</ol>
<li>Continue to the next element.  (Which will be the first element in the child list if one existed)</li>
<li></li>
</ol>

What needs to be done to reverse this process?  Well we should probably start at the beginning which will be the same as the flattening.  

<ol>
<li>Starting at the head check each element for a child</li>
<li>If the element has a child,
<ol> 
  <li>unlink the child elements from the top list.<li>
  <li>Return to step 1 with the child list's first element as a target.<li>
</ol>
<li>Continue to the next element.  (Which will be the first element in the child list if one existed)</li>
<li></li>
</ol>

While it sounds correct this plan will prove ultimately futile.  When we flattened our list we started at the bottom and worked our way up.  If we reverse this process we need to start at the top and work our way down.

<ol>
<li>Starting at the head check each element for a child</li>
<li>If the element has a child goto step 1 with the child's first element as a target.<li>
<li>Make the elements next node equal to the next node of the last element of the child list.</li>
<li>Continue to the next element.  (Which will be the element after the tail of the child list if there was a child)</li>
</ol>

In this case the code seems easier to understand than the aforementioned steps.

<pre>
#code omitted here
  def unflatten!()
    unflatten_by_recursion(@head)
  end
#code omitted here
  def unflatten_by_recursion(element)
    unless element.nil?
      if element.child.nil?
        unflatten_by_recursion(element.next_node)
      else
        unflatten_by_recursion(element.child.element_at(0))        
        @length = @length - element.child.length()
        element.next_node=element.child.last.next_node        
      end
    end
  end
#code omitted here
</pre>





