class Tree
  require_relative 'node'

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    # sort elements in the array
    # remove duplicates
    arr = array.sort.uniq
    # build tree which returns level 0 root node
    
  end
end