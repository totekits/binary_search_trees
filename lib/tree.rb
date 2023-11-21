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

  def find_min(ref)
    return ref if ref.left.nil?
    find_min(ref.left)
  end

  def delete(value, ref = @root, parent = nil)
    return if ref.nil?

    if value < ref.data 
      delete(value, ref.left, ref)
    elsif value > ref.data
      delete(value, ref.right, ref)
    else
      if ref.left.nil? && ref.right.nil?
        if parent.left == ref
          parent.left = nil
        else 
          parent.right = nil
        end
      elsif ref.left.nil? && !ref.right.nil?
        if parent.left == ref
          parent.left = ref.right
        else
          parent.right = ref.right
        end
      elsif !ref.left.nil? && ref.right.nil?
        if parent.left == ref
          parent.left = ref.left
        else
          parent.right = ref.right
        end
      else
        temp = find_min(ref.right)
        if parent.left == ref
          parent.left = temp
        else
          parent.right = temp
        end
        temp.left = ref.left
      end
    end
  end

  def find(value, ref = @root)
    return nil if ref.nil?

    if value < ref.data
      find(value, ref.left)
    elsif value > ref.data
      find(value, ref.right)
    else
      return ref
    end

    nil
  end

  def level_order(q = [@root], result = [])
    return result if q.empty?

    if block_given?
      result << yield(q[0].data)
      q << q[0].left if !q[0].left.nil?
      q << q[0].right if !q[0].right.nil?
      q.shift
    else
      result << q[0].data
      q << q[0].left if !q[0].left.nil?
      q << q[0].right if !q[0].right.nil?
      q.shift
    end
    
    level_order(q, result)
  end
end