# The Tree class was interesting, but it did not allow you to specify 
# a new tree with a clean user interface.  Let the initializer accept 
# a nested structure with hashes and arrays.  
#
# You should be able to specify a tree like this:
# {'grandpa'=>{'dad'=>{'child1'=>{},'child2'=>{}},
#              'uncle'=>{'child3'=>{},'child4'=>{}}
#             }
# }
class Tree
  attr_accessor :children, :node_name

  def initialize(tree={})
    tree = tree.to_a.flatten
    @node_name = tree[0]

    @children = []
    tree[1].each do |child, grandkids|
      @children << Tree.new(child => grandkids)
    end if tree[1]
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

# verify empty node
ruby_tree = Tree.new
ruby_tree.visit { |node| puts "Empty node: [#{node.node_name}]" }
ruby_tree.visit_all { |node| puts "Empty traversal: [#{node.node_name}]" }
puts

def exercise_tree(tree)
  puts 'Visiting a node'
  tree.visit { |node| puts node.node_name }
  puts

  puts 'Visiting entire tree'
  tree.visit_all { |node| puts node.node_name }
  puts
end

exercise_tree Tree.new({'Ruby' => {'Reia' => {}, 'MacRuby' => {}}})
exercise_tree Tree.new({'grandpa'=>{'dad'=>{'child1'=>{},'child2'=>{}},'uncle'=>{'child3'=>{},'child4'=>{}}}})
