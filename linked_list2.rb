class LinkedListNode
    attr_accessor :value, :next_node
    
    def initialize(value, next_node=nil)
        @value = value
        @next_node = next_node
    end
  
end

class Stack
    attr_reader :head
    
    def initialize
        @head = nil
    end
    
    def push(value)
        @head = LinkedListNode.new(value, @head) 
    end
    
    def peek
        @head.value            
    end
    
    def pop
        first_node = @head
        @head = @head.next_node
        first_node.next_node = nil
        first_node.value
    end
    
end

def print_values(list_node) 
    if list_node
        print "#{list_node.value} -->"
        print_values(list_node.next_node)
    else
        print "nil\n"
        return
    end
end


def reverse(list) #preserve state of stack

    reverse_stack = Stack.new

    while list
        @head = list
        reverse_stack.push(@head.value)
        
        list = list.next_node
    end
    reverse_stack
end

def reverse_list(list, previous=nil) #mutate state of stack
   
    if  list
        nextnode = list.next_node
        list.next_node = previous
        reverse_list(nextnode, list)
    else
        previous
    end

end
   
NewStack = Stack.new


NewStack.push(37)
NewStack.push(99)
NewStack.push(12)


linked_list = print_values(NewStack.head)
reverse_linked_list = print_values(reverse_list(NewStack.head))