require_relative 'item'

class List

  attr_accessor :label
  attr_reader :items

  def initialize(label)
    @items = []
    @label = label
  end

  def [](index)
    items[index]
  end

  def add_item(title, deadline, description = '')
    return false if !Item.valid_date?(deadline)
    @items <<  Item.new(title, deadline, description)
  end

  def size
    items.length
  end

  def valid_index?(index)
    0 <= index && index < self.size
  end

  def swap(index1, index2)
    return false if !valid_index?(index1) || !valid_index?(index2)

    items[index1], items[index2] = items[index2], items[index1]
  end

  def priority
    items.first
  end
end