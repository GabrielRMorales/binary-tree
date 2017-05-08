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
tree.right_child=Node.new(array[1], tree)
temp=tree

  while (array[i+2]!=nil) do
    i+=2
    temp.parent=Node.new(array[i])
    temp.parent.left_child=temp
    temp=temp.parent
    if (array[i+1]!=nil)
    temp.right_child=Node.new(array[i+1])
    temp.right_child.parent=temp
    end
  end
  tree
end

def build_tree_refactored(array)
i=0
tree=Node.new(array[0])
temp=tree
i+=1
  while (i<array.length) do
    if array[i]<=temp.data
      if temp.left_child==nil
       
        temp.left_child=Node.new(array[i], temp)
    
        i+=1
        temp=tree
      else
        temp=temp.left_child
      end
    else
      if temp.right_child==nil
      temp.right_child=Node.new(array[i], temp)
      
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
    current=node_arr[j]
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

def depth_first_search(current, value)
  checked_array=0
  newarr=[]
  newarr.push(current)
  return current.data if current.data==value
  while current.data!=value do
    return nil if checked_array>2
    puts "current is #{current.data}"
    while current.left_child!=nil do
      current=current.left_child
      newarr.push(current)
      return current.data if current.data==value      
    end    
    i=newarr.length-1
    puts "i is newarr.length aka #{i}"
    while i!=0 do
      current=newarr[i]
      puts "current is #{current.data}"
      newarr.pop
      i-=1
      puts "i is #{i}, arr.length is #{newarr.length}"
      puts " "
      if current.right_child!=nil
      temp=current.right_child        
      return temp.data if temp.data==value      
      end
    end    
    if i==0
      checked_array+=1
      newarr=[newarr[0]]
      current=newarr[0]
      current=current.right_child
      puts "close to 7"
      return current.data if current.data==value 
      newarr.push(current)
    end
  end
end

def dfs_rec(node, value, arr)
  if node==nil
    return
  end
  current=node
  arr.push(current.data)
  dfs_rec(current.left_child, value, arr)
  dfs_rec(current.right_child, value, arr)
  arr
  puts current if current.data==value
end
