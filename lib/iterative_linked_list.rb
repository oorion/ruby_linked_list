class IterativeLinkedList
  def initialize
    @list = []
    @node_index = 0
  end

  def count
    @list.count
  end

  def push(element)
    new_node = LinkedListNode.new(element)
    unless @list.empty?
      @list.last.update_next_node(new_node)
    end
    @list << new_node
  end

  def pop
    @list.empty? ? nil : @list.pop.name
  end

  def delete(element)
    @list.delete_if { |item| item.name == element }
  end

  def to_a
    @list.map { |item| item.name }
  end

  def last_node
    @list.last
  end

  def head_node
    @list.first
  end

  def include?(name)
    @list.any? { |item| item.name == name }
  end

  def find(name)
    @list.find { |item| item.name == name }
  end

  def insert(index, name)
    new_node = LinkedListNode.new(name)
    @list[index-1].update_next_node(new_node)
    new_node.update_next_node(@list[index])
    @list.insert(index, new_node)
  end

  def index(name)
    @list.index(@list.find { |item| item.name == name })
  end

  def insert_after(existing_node, new_node_name)
    next_spot = index(existing_node)+1
    insert(next_spot, new_node_name)
  end
end

class LinkedListNode
  attr_reader :name

  def initialize(name, next_node=nil)
    @name = name
    @next_node = next_node
  end

  def data
    @name
  end

  def update_next_node(node)
    @next_node = node
  end

  def next_node
    @next_node
  end
end
