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

  private

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
