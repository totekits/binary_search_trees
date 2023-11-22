require_relative 'lib/tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts "The tree is balanced: #{tree.balance?}"
puts "Level order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"
tree.insert(111)
tree.insert(222)
tree.insert(333)
puts "The tree is balanced after adding heavy numbers: #{tree.balance?}"
