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

  def insert(value, node = @root)
    return if value == node.data

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
      insert(new_node.data, node.right)
      else
        node.left = new_node
        return
      end
    end

    if node.right.nil?
      if new_node.data < node.data
      insert(new_node.data, node.left)
      else
        node.right = new_node
        return
      end
    end

    if new_node.data < node.data
      insert(new_node.data, node.left)
    else
      insert(new_node.data, node.right)
    end
  end
end