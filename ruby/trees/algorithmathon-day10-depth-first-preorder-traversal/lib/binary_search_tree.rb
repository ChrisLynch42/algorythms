class BinarySearchTree
  attr_reader :root

  def initialize(root=nil)
    @root=root
  end

  def add(new_node)
    if new_node.nil?
      new_node
    else
      if @root.nil?
        @root = new_node
      else
        add_by_recursion(@root,new_node)
      end
    end
  end

  def depth_preorder()
    return_value=Array.new()
    depth_preorder_by_recursion(@root,return_value)
    return_value
  end

  def depth_preorder_alt()
    return_value=Array.new()
    depth_preorder_by_iteration(@root,return_value)
    return_value
  end

  private

  def depth_preorder_by_recursion(current_node,tracker)
    unless current_node.nil?
      tracker.push(current_node.data)
      unless current_node.lesser.nil?
        depth_preorder_by_recursion(current_node.lesser,tracker)
      end
      unless current_node.greater.nil?
        depth_preorder_by_recursion(current_node.greater,tracker)
      end
    end
  end

  def depth_preorder_by_iteration(start_node,tracker)
    current_node=start_node
    the_stack=Array.new()
    while !current_node.nil?
      tracker.push(current_node.data)
      unless current_node.greater.nil?
        the_stack.push(current_node.greater)
      end
      unless current_node.lesser.nil?
        the_stack.push(current_node.lesser)
      end
      current_node=the_stack.pop()
    end
  end
  




  def add_by_recursion(current_node,new_node)
    if current_node.nil?
      current_node
    else
      if current_node.greater_than?(new_node)
        if current_node.lesser.nil?
          current_node.lesser=new_node
        else
          add_by_recursion(current_node.lesser,new_node)
        end            
      elsif current_node.less_than?(new_node)
        if current_node.greater.nil?
          current_node.greater=new_node
        else
          add_by_recursion(current_node.greater,new_node)
        end
      else
        raise "Node matches existing node" + new_node.data.to_s
      end 
    end
  end

end
