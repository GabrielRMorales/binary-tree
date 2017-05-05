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

#possible recursive method
def traversal(temp, i)
    if i==arr.length 
      return tree
    
    elsif array[i]<temp.data
    
      if temp.left_child==nil
        temp.left_child=Node.new(arr[i], temp)
        puts "#{temp.data}"
        traversal(tree, i+1)
        
      else
        puts "#{temp.data}"
        traversal(temp.left_child, i)
      end
      
    else
      if temp.right_child==nil
      temp.right_child=Node.new(arr[i], temp)
      puts "#{temp.data}"
      traversal(tree, i+1)
      
      else
      traversal(temp.right_child, i)
      end
      
    end    

end