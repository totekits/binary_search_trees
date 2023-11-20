class Tree
  require_relative 'node'

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return if array.empty?

    arr = array.sort.uniq
    return Node.new(arr[0]) if arr.size == 1

    mid = arr.size / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid..-1])
    root
  end

  def traverse(node, value)
    return if node.data == value

    new_node = Node.new(value)

    if node.left.nil? && node.right.nil?
      if new_node.data < node.data
        node.left = new_node
      elsif new_node.data > node.data
        node.right = new_node
      end
      return
    end
    
    if node.left.nil?
      if new_node.data > node.data
        traverse(node.right, value)
      else
        node.left = new_node
        return
      end
    end

    if node.right.nil?
      if new_node.data < node.data
        traverse(node.left, value)
      else
        node.right = new_node
        return
      end
    end
  end
   
  def insert(value)
    traverse(@root, value)
  end
end