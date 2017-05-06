class Node
attr_accessor :data, :parent, :left_child, :right_child
def initialize(data="nil", parent="nil", left_child=nil, right_child=nil)
@data=data
@left_child=left_child
@right_child=right_child
@parent=parent
end

end

#for sorted arrays
def build_tree(array)
i=0
tree=Node.new(array[0])
tree.right_child=Node.new(array[1], tree)
puts "data: #{tree.data}"
puts "right_child: #{tree.right_child}"
puts "left_child: #{tree.left_child}"
puts "parent: #{tree.parent}"
puts " "
temp=tree

  while (array[i+2]!=nil) do
    i+=2
    temp.parent=Node.new(array[i])
    temp.parent.left_child=temp
    temp=temp.parent
    #temp.left_child=array[i-2]
    if (array[i+1]!=nil)
    temp.right_child=Node.new(array[i+1])
    temp.right_child.parent=temp
    end
    puts "data: #{temp.data}"
    puts "right_child: #{temp.right_child}"
    puts "left_child: #{temp.left_child}"
    puts "parent: #{temp.parent}"
    puts " "
  end
  tree
end

#for unsorted arrays
def build_tree_refactored(array)
i=0
tree=Node.new(array[0])
temp=tree
i+=1
  while (i<array.length) do
    if array[i]<=temp.data
      if temp.left_child==nil
       
        temp.left_child=Node.new(array[i], temp)
        puts "#{temp.data}"
    
        i+=1
        temp=tree
      else
        temp=temp.left_child
      end
    else
      if temp.right_child==nil
      temp.right_child=Node.new(array[i], temp)
      puts "#{temp.data}"
      
      i+=1
      temp=tree
      else
      temp=temp.right_child
      end
    end        
  end
 tree
end

def breadth_first_search(binarytree, value)
node_arr=[]
current=binarytree
node_arr.push(current)
j=0
  while j<node_arr.length do
  puts "j #{j}"
    current=node_arr[j]
  puts "current #{current}"
  puts "#{current.data}"

    if current.left_child!=nil
      node_arr.push(current.left_child)
      temp=current.left_child
      return temp if temp.data==value
    end
    if current.right_child!=nil
      node_arr.push(current.right_child)
      temp=current.right_child
      return temp if temp.data==value
    end  
    j+=1
  end
  
end
