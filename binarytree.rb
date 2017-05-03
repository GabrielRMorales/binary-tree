class Node
attr_accessor :data, :parent, :left_child, :right_child
def initialize(data="nil", parent="nil", left_child=nil, right_child=nil)
@data=data
@left_child=left_child
@right_child=right_child
@parent=parent

end
end

def build_tree(array)
i=0
tree=Node.new(array[0])
tree.right_child=Node.new(array[1])
puts "data: #{tree.data}"
puts "right_child: #{tree.right_child}"
puts "left_child: #{tree.left_child}"
puts "parent: #{tree.parent}"
puts " "
temp=tree

  while (array[i+2]!=nil) do
    i+=2
    temp.parent=Node.new(array[i])
    temp=temp.parent
    temp.left_child=array[i-2]
    temp.right_child=array[i+1]
    puts "data: #{temp.data}"
    puts "right_child: #{temp.right_child}"
    puts "left_child: #{temp.left_child}"
    puts "parent: #{temp.parent}"
    puts " "
  end
  tree
end