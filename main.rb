require_relative 'lib/tree'

tree = build_tree(Array.new(15) { rand(1..100) })
pretty_print(tree.root)
puts "The tree is balanced: #{tree.balance?}"
puts "Level order: #{level_order(tree.root)}"
puts "Preorder: #{preorder(tree.root)}"
puts "Postorder: #{postorder(tree.root)}"
puts "Inorder: #{inorder(tree.root)}"
tree.insert(111)
tree.insert(222)
tree.insert(333)
puts "The tree is balanced after adding heavy numbers: #{tree.balance?}"
rebalance(tree)
puts "The tree is balanced after rebalance method was called: #{tree.balance?}"
puts "Level order: #{level_order(tree.root)}"
puts "Preorder: #{preorder(tree.root)}"
puts "Postorder: #{postorder(tree.root)}"
puts "Inorder: #{inorder(tree.root)}"
