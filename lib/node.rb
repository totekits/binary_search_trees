class Node
  include Comparable

  def initialize(value, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end