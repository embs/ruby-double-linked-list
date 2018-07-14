class Node
  attr_accessor :element, :previous_node, :next_node, :first, :last

  def initialize(element, prev = nil, nxt = nil)
    @element = element
    @previous_node = prev
    @next_node = nxt
  end

  def first
    previous_node.nil?
  end

  def last
    next_node.nil?
  end
end

class DoubleLinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def add(element)
    if head.nil?
      @head = @tail = Node.new(element)
    else
      new_node = Node.new(element, tail)
      tail.next_node = new_node
      @tail = new_node
    end
    @size = size + 1
  end

  def remove(element)
    return nil if size.zero?

    current_node = head
    while(!current_node.nil?) do
      if(element == current_node.element)
        @size = size - 1

        if current_node == head
          @head = current_node.next_node
        elsif current_node == tail
          @tail = current_node.previous_node
        else
          previous = current_node.previous_node
          nxt = current_node.next_node
          previous.next_node = nxt
          nxt.previous_node = previous
        end

        return current_node.element
      end

      current_node = current_node.next_node
    end
  end

  def print
    current_node = head
    while(!current_node.nil?) do
      p current_node.element
      current_node = current_node.next_node
    end
  end
end
